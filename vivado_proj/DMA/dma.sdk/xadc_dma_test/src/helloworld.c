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
#include "adc.h"

#define SAMPLES_PER_FRAME  0x100 //4MB

adc_t*  Adc_Instance;	//XADC Instance

u16     rcv_buf[SAMPLES_PER_FRAME];

int main()
{
	// Local variables
	int     status;
	int     ii = 0;

    init_platform();

    print("Hello World\n\r");

    // Create ADC object
    Adc_Instance = adc_create
    (
    	XPAR_GPIO_0_DEVICE_ID,
    	XPAR_AXIDMA_0_DEVICE_ID,
    	sizeof(int)
    );
    if (Adc_Instance == NULL)
    {
    	xil_printf("ERROR! Failed to create ADC instance.\n\r");
    	return -1;
    }

    // Set the desired parameters for the ADC/DAC objects
    adc_set_bytes_per_sample(Adc_Instance, sizeof(u16));
    adc_set_samples_per_frame(Adc_Instance, SAMPLES_PER_FRAME);

	// Make sure the buffers are clear before we populate it (generally don't need to do this, but for proving the DMA working, we do it anyway)
	memset(rcv_buf, 0, SAMPLES_PER_FRAME*sizeof(u16));

	// Enable/initialize and dac
	adc_enable(Adc_Instance);

	// Process data
	xil_printf("Starting data processing...\n\r");
	for (ii = 0; ii < 1; ii++)
	{

		// Get new frame from ADC
		status = adc_get_frame(Adc_Instance, rcv_buf);
		if (status != ADC_SUCCESS)
		{
			xil_printf("ERROR! Failed to get a new frame of data from the ADC.\n\r");
			return -1;
		}

		xil_printf("get adc data:\r\n");
		for(int i = 0; i < SAMPLES_PER_FRAME; i++) {
			xil_printf("%x\r\n", rcv_buf[i]);
			if((i+1) % 8 == 0) {
				xil_printf("\r\n");
			}
		}
		xil_printf("\r\n");
/*

		// *********************** Insert your code here ***********************
		process_data(SAMPLES_PER_FRAME, snd_buf, rcv_buf);
		// *********************************************************************

		// Send processed data frame out to DAC
		status = dac_send_frame(p_dac_inst, snd_buf);
		if (status != DAC_SUCCESS)
		{
			xil_printf("ERROR! Failed to send the processed data frame out to the DAC.\n\r");
			return -1;
		}

		// ***************************** Remove me *****************************
		status = verify_data(&axis_fifo_inst, ii);
		if (status != DATA_CORRECT)
		{
			xil_printf("ERROR! Data incorrect.\n\r");
			return -1;
		}

		xil_printf("Frame %d completed without errors. Press any key to process the next frame of data.\n\r", ii);
		XUartPs_RecvByte(XPAR_PS7_UART_1_BASEADDR);
		// *********************************************************************
*/

	}

	// Disable the adc
	adc_destroy(Adc_Instance);

    cleanup_platform();
    return 0;
}
