with Interfaces.C; 

package LSM9DS1 is
	
	type register is new Interfaces.C.int range 16#00# .. 16#ff#;

LSM9DS1_MAG_ADDRESS : register	:= 16#1C#;	--Would be 0x1E if SDO_M is HIGH		
LSM9DS1_ACC_ADDRESS : register	:= 16#6A#;
LSM9DS1_GYR_ADDRESS : register	:= 16#6A#;	--Would be 0x6B if SDO_AG is HIGH


--/////////////////////////////////////////
--// LSM9DS1 Accel/Gyro (XL/G) Registers //
--/////////////////////////////////////////
LSM9DS1_ACT_THS	 : register	:= 16#04#;
LSM9DS1_ACT_DUR	 : register	:= 16#05#;
LSM9DS1_INT_GEN_CFG_XL : register	:=	 16#06#;
LSM9DS1_INT_GEN_THS_X_XL : register	:= 16#07#;
LSM9DS1_INT_GEN_THS_Y_XL : register	:= 16#08#;
LSM9DS1_INT_GEN_THS_Z_XL : register	:= 16#09#;
LSM9DS1_INT_GEN_DUR_XL : register	:=	 16#0A#;
LSM9DS1_REFERENCE_G : register	:=		 16#0B#;
LSM9DS1_INT1_CTRL : register	:=		 16#0C#;
LSM9DS1_INT2_CTRL : register	:=		 16#0D#;
LSM9DS1_WHO_AM_I_XG : register	:=		 16#0F#;
LSM9DS1_CTRL_REG1_G : register	:=		 16#10#;
LSM9DS1_CTRL_REG2_G : register	:=		 16#11#;
LSM9DS1_CTRL_REG3_G : register	:=		 16#12#;
LSM9DS1_ORIENT_CFG_G : register	:=	 16#13#;
LSM9DS1_INT_GEN_SRC_G : register	:=	 16#14#;
LSM9DS1_OUT_TEMP_L : register	:=		 16#15#;
LSM9DS1_OUT_TEMP_H : register	:=		 16#16#;
LSM9DS1_STATUS_REG_0 : register	:=	 16#17#;
LSM9DS1_OUT_X_L_G : register	:=		 16#18#;
LSM9DS1_OUT_X_H_G : register	:=		 16#19#;
LSM9DS1_OUT_Y_L_G : register	:=		 16#1A#;
LSM9DS1_OUT_Y_H_G : register	:=		 16#1B#;
LSM9DS1_OUT_Z_L_G : register	:=		 16#1C#;
LSM9DS1_OUT_Z_H_G : register	:=		 16#1D#;
LSM9DS1_CTRL_REG4 : register	:=		 16#1E#;
LSM9DS1_CTRL_REG5_XL : register	:=	 16#1F#;
LSM9DS1_CTRL_REG6_XL : register	:=	 16#20#;
LSM9DS1_CTRL_REG7_XL : register	:=	 16#21#;
LSM9DS1_CTRL_REG8 : register	:=		 16#22#;
LSM9DS1_CTRL_REG9 : register	:=		 16#23#;
LSM9DS1_CTRL_REG10 : register	:=		 16#24#;
LSM9DS1_INT_GEN_SRC_XL : register	:=	 16#26#;
LSM9DS1_STATUS_REG_1 : register	:=	 16#27#;
LSM9DS1_OUT_X_L_XL : register	:=		 16#28#;
LSM9DS1_OUT_X_H_XL : register	:=		 16#29#;
LSM9DS1_OUT_Y_L_XL : register	:=		 16#2A#;
LSM9DS1_OUT_Y_H_XL : register	:=		 16#2B#;
LSM9DS1_OUT_Z_L_XL : register	:=		 16#2C#;
LSM9DS1_OUT_Z_H_XL : register	:=		 16#2D#;
LSM9DS1_FIFO_CTRL : register	:=		 16#2E#;
LSM9DS1_FIFO_SRC : register	:=		 16#2F#;
LSM9DS1_INT_GEN_CFG_G : register	:=	 16#30#;
LSM9DS1_INT_GEN_THS_XH_G  : register	:=	 16#31#;
LSM9DS1_INT_GEN_THS_XL_G  : register	:=	 16#32#;
LSM9DS1_INT_GEN_THS_YH_G  : register	:=	 16#33#;
LSM9DS1_INT_GEN_THS_YL_G  : register	:=	 16#34#;
LSM9DS1_INT_GEN_THS_ZH_G  : register	:=	 16#35#;
LSM9DS1_INT_GEN_THS_ZL_G  : register	:=	 16#36#;
LSM9DS1_INT_GEN_DUR_G	  : register	:=	 16#37#;

--#///////////////////////////////
--#// LSM9DS1 Magneto Registers //
--#///////////////////////////////
LSM9DS1_OFFSET_X_REG_L_M  : register	:=	 16#05#;
LSM9DS1_OFFSET_X_REG_H_M  : register	:=	 16#06#;
LSM9DS1_OFFSET_Y_REG_L_M  : register	:=	 16#07#;
LSM9DS1_OFFSET_Y_REG_H_M  : register	:=	 16#08#;
LSM9DS1_OFFSET_Z_REG_L_M  : register	:=	 16#09#;
LSM9DS1_OFFSET_Z_REG_H_M  : register	:=	 16#0A#;
LSM9DS1_WHO_AM_I_M : register	:=	 	 16#0F#;
LSM9DS1_CTRL_REG1_M : register	:=		 16#20#;
LSM9DS1_CTRL_REG2_M : register	:=		 16#21#;
LSM9DS1_CTRL_REG3_M : register	:=		 16#22#;
LSM9DS1_CTRL_REG4_M : register	:=		 16#23#;
LSM9DS1_CTRL_REG5_M : register	:=		 16#24#;
LSM9DS1_STATUS_REG_M : register	:=	 	 16#27#;
LSM9DS1_OUT_X_L_M : register	:=		 16#28#;
LSM9DS1_OUT_X_H_M : register	:=	 16#29#;
LSM9DS1_OUT_Y_L_M : register	:=	 16#2A#;
LSM9DS1_OUT_Y_H_M : register	:=	 16#2B#;
LSM9DS1_OUT_Z_L_M : register	:=	 16#2C#;
LSM9DS1_OUT_Z_H_M : register	:=	 16#2D#;
LSM9DS1_INT_CFG_M : register	:=	 16#30#;
LSM9DS1_INT_SRC_M : register	:=	 16#30#;
LSM9DS1_INT_THS_L_M : register	:=	 16#32#;
LSM9DS1_INT_THS_H_M : register	:=	 16#33#;

--#////////////////////////////////
--#// LSM9DS1 WHO_AM_I Responses //
--#////////////////////////////////
LSM9DS1_WHO_AM_I_AG_RSP	 : register	:=	 16#68#;
LSM9DS1_WHO_AM_I_M_RSP : register	:=	 16#3D#;
end LSM9DS1;
