/*
 * xadc.h
 *
 *  Created on: 2019��1��9��
 *      Author: admin
 */

#ifndef SRC_XADC_H_
#define SRC_XADC_H_

#include "xparameters.h"
#include "xsysmon.h"
#include "xil_types.h"

int InitXADC(XSysMon *SysMonInst, u32 DeviceId);

#endif /* SRC_XADC_H_ */
