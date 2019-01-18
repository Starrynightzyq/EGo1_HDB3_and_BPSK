/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xaxidma.h"
#include "xsysmon.h"
#include "sleep.h"
#include "dma_intr.h"
#include "xadc.h"

//#define DEBUG_PRINT_DMA

#define INTC_DEVICE_ID			XPAR_SCUGIC_0_DEVICE_ID
#define DMA_DEVICE_ID			XPAR_AXIDMA_0_DEVICE_ID
#define DMA_TX_INTR_ID			XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID
#define DMA_RX_INTR_ID			XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID
#define SYSMON_DEVICE_ID		XPAR_SYSMON_0_DEVICE_ID
#define XADC_GPIO_DEVICE_ID		XPAR_GPIO_0_DEVICE_ID

#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
		DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR		0x01000000
#else
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x1000000)
#endif

#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00300000)
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x004FFFFF)

#define TEST_START_VALUE	0xC
/*
 * Buffer and Buffer Descriptor related constant definition
 */
#define MAX_PKT_LEN		128//4MB 0x100

#define NUMBER_OF_TRANSFERS	10
/*
 * Flags interrupt handlers use to notify the application context the events.
 */
extern volatile int DmaTxDone;
extern volatile int DmaRxDone;
extern volatile int DmaError;

XScuGic InterruptController;	/* Instance of the Interrupt Controller */
XAxiDma DmaInstrance;			//DMA
XSysMon SysMonInstrance;		//XADC
XGpio   Gpio_Adc;

int Init_System(void);
int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr);
int InitInterruptController(XScuGic *XScuGicInstancePtr, u16 DeviceId);
static int DmaLoopTest();
static int CheckData(int Length, u8 StartValue);
static int DmaReceiveTest();

int main()
{
    init_platform();

    Init_System();

    print("Hello World\n\r");

//    DmaLoopTest();
    DmaReceiveTest();

    cleanup_platform();
    return 0;
}

int Init_System(void) {
	//
	XGpio_Initialize(&Gpio_Adc, XADC_GPIO_DEVICE_ID);
	XGpio_SetDataDirection(&Gpio_Adc, 1, 0x0000);
	XGpio_DiscreteWrite(&Gpio_Adc, 1, MAX_PKT_LEN);

	//初始化中断控制器
	InitInterruptController(&InterruptController, INTC_DEVICE_ID);

	//初始化DMA
	DMA_Init(&DmaInstrance, DMA_DEVICE_ID, DMA_TX_INTR_ID, DMA_RX_INTR_ID,
			&InterruptController, DMATxIntrHandler, DMARxIntrHandler);

	//初始化xadc
	InitXADC(&SysMonInstrance, SYSMON_DEVICE_ID);

	return XST_SUCCESS;
}

int SetUpInterruptSystem(XScuGic *XScuGicInstancePtr)
{

	/*
	 * Connect the interrupt controller interrupt handler to the hardware
	 * interrupt handling logic in the ARM processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			XScuGicInstancePtr);

	/*
	 * Enable interrupts
	 */
	Xil_ExceptionEnableMask(XIL_EXCEPTION_ALL);

	return XST_SUCCESS;
}

int InitInterruptController(XScuGic *XScuGicInstancePtr, u16 DeviceId) {
	int Status;
	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	static XScuGic_Config *GicConfig;    /* The configuration parameters of the controller */
	GicConfig = XScuGic_LookupConfig(DeviceId);
	if (NULL == GicConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(XScuGicInstancePtr, GicConfig,
					GicConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built
	 * correctly
	 */
	Status = XScuGic_SelfTest(XScuGicInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the Interrupt System
	 */
	Status = SetUpInterruptSystem(XScuGicInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


static int DmaReceiveTest() {
	int Status;
	u8 Value;
	u32 Index;
	u8 *TxBufferPtr;
	u8 *RxBufferPtr;
	int Tries = NUMBER_OF_TRANSFERS;

	TxBufferPtr = (u8 *)TX_BUFFER_BASE;
	RxBufferPtr = (u8 *)RX_BUFFER_BASE;

	xil_printf("\r\n----DMA Test----\r\n");
	xil_printf("PKT_LEN=%d\r\n",MAX_PKT_LEN);

	Value = TEST_START_VALUE;

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN);

	/* receive a packet */

	Status = XAxiDma_SimpleTransfer(&DmaInstrance,(UINTPTR) RxBufferPtr,
				MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Wait RX done
	 */
	while (!DmaRxDone && !DmaError) { /*&& !DmaError*/
			/* NOP */
	}

	if (DmaError) {
		xil_printf("Failed test transmit%s done, "
		"receive%s done\r\n", DmaTxDone? "":" not",
				DmaRxDone? "":" not");

		goto Done;

	}

	xil_printf("xadc data is :\r\n");
	for(u32 Index = 0; Index < MAX_PKT_LEN; Index++) {
		xil_printf("%x ", RxBufferPtr[Index]);
		if((Index+1)%16 == 0) {
			xil_printf("\r\n");
		}
	}



	xil_printf("Successfully receive xadc data by DMA\r\n");
Done:
	return XST_SUCCESS;
}


static int DmaLoopTest() {
	int Status;
	u8 Value;
	u32 Index;
	u8 *TxBufferPtr;
	u8 *RxBufferPtr;
	int Tries = NUMBER_OF_TRANSFERS;

	TxBufferPtr = (u8 *)TX_BUFFER_BASE;
	RxBufferPtr = (u8 *)RX_BUFFER_BASE;

	xil_printf("\r\n----DMA Test----\r\n");
	xil_printf("PKT_LEN=%d\r\n",MAX_PKT_LEN);

	Value = TEST_START_VALUE;

#ifdef DEBUG_PRINT_DMA
	xil_printf("\r\nDMA TxData:\r\n");
#endif
	for(Index = 0; Index < MAX_PKT_LEN; Index ++) {
			TxBufferPtr[Index] = Value;
#ifdef DEBUG_PRINT_DMA
			xil_printf("%x ", TxBufferPtr[Index]);
#endif
			Value = (Value + 1) & 0xFF;
	}
#ifdef DEBUG_PRINT_DMA
	xil_printf("\r\n");
#endif

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN);

	/* Send a packet */
	for(Index = 0; Index < Tries; Index ++) {

		Status = XAxiDma_SimpleTransfer(&DmaInstrance,(UINTPTR) RxBufferPtr,
					MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		Status = XAxiDma_SimpleTransfer(&DmaInstrance,(UINTPTR) TxBufferPtr,
					MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}


		/*
		 * Wait TX done and RX done
		 */
		while (!DmaTxDone && !DmaRxDone && !DmaError) {
				/* NOP */
		}

		if (DmaError) {
			xil_printf("Failed test transmit%s done, "
			"receive%s done\r\n", DmaTxDone? "":" not",
					DmaRxDone? "":" not");

			goto Done;

		}

		/*
		 * Test finished, check data
		 */
		Status = CheckData(MAX_PKT_LEN, 0xC);
		if (Status != XST_SUCCESS) {
			xil_printf("Data check failed\r\n");
			goto Done;
		}
	}


	xil_printf("Successfully ran AXI DMA interrupt Example\r\n");
Done:
	return XST_SUCCESS;
}

/*****************************************************************************/
/*
*
* This function checks data buffer after the DMA transfer is finished.
*
* We use the static tx/rx buffers.
*
* @param	Length is the length to check
* @param	StartValue is the starting value of the first byte
*
* @return
*		- XST_SUCCESS if validation is successful
*		- XST_FAILURE if validation is failure.
*
* @note		None.
*
******************************************************************************/
static int CheckData(int Length, u8 StartValue)
{
	u8 *RxPacket;
	int Index = 0;
	u8 Value;

	RxPacket = (u8 *) RX_BUFFER_BASE;
	Value = StartValue;

	/* Invalidate the DestBuffer before receiving the data, in case the
	 * Data Cache is enabled
	 */
#ifndef __aarch64__
	Xil_DCacheInvalidateRange((UINTPTR)RxPacket, Length);
#endif

#ifdef DEBUG_PRINT_DMA
	xil_printf("\r\nDMA RxData:\r\n");
#endif
	for(Index = 0; Index < Length; Index++) {
#ifdef DEBUG_PRINT_DMA
		xil_printf("%x ", RxPacket[Index]);
#endif
		if (RxPacket[Index] != Value) {
			xil_printf("Data error %d: %x/%x\r\n",
			    Index, RxPacket[Index], Value);

			return XST_FAILURE;
		}
		Value = (Value + 1) & 0xFF;
	}
#ifdef DEBUG_PRINT_DMA
	xil_printf("\r\n");
#endif

	return XST_SUCCESS;
}
