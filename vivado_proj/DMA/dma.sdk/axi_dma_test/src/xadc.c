/*
 * xadc.c
 *
 *  Created on: 2019年1月9日
 *      Author: admin
 */

#include "xadc.h"

int InitXADC(XSysMon *SysMonInst, u32 DeviceId) {
	int Status;
	XSysMon_Config *ConfigPtr;

	//使用Sysmon驱动程序初始化XADC
	ConfigPtr = XSysMon_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
			xil_printf("no config\r\n");
			return XST_FAILURE;
	}

	Status = XSysMon_CfgInitialize(SysMonInst, ConfigPtr, ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XSysMon_SetSequencerMode(SysMonInst, XSM_SEQ_MODE_SAFE);
	XSysMon_SetSequencerMode(SysMonInst, XSM_SEQ_MODE_CONTINPASS);	//单通道模式
	XSysMon_SetSingleChParams(SysMonInst,XSM_CH_VPVN,1,0,0);		//设置Vp/Vn输入通道的单通道参数：单极性模式，非事件驱动，标准采集，周期数
	XSysMon_SetAlarmEnables(SysMonInst, 0x0);						//清除警报
	XSysMon_SetCalibEnables(SysMonInst,XSM_CFR1_CAL_VALID_MASK );	//应用校准
	XSysMon_GetStatus(SysMonInst); /* Clear the old status */

	return XST_SUCCESS;
}
