/*
 * dma_intr.h
 *
 *  Created on: 2019Äê1ÔÂ8ÈÕ
 *      Author: admin
 */

#ifndef SRC_DMA_INTR_H_
#define SRC_DMA_INTR_H_

#include "xil_types.h"
#include "xscugic.h"
#include "xaxidma.h"

void DMATxIntrHandler(void *Callback);
void DMARxIntrHandler(void *Callback);

int DMA_Init(XAxiDma * DmaInstancePtr, u32 DeviceId, u32 TxIntrId, u32 RxIntrId,
		XScuGic *IntcInstancePtr, Xil_InterruptHandler TxIntrHandler, Xil_InterruptHandler RxIntrHandler);

#endif /* SRC_DMA_INTR_H_ */
