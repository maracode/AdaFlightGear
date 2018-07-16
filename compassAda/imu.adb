with linux_types_h; use linux_types_h;
with i2c_dev_h;
with GNAT.OS_Lib; use GNAT.OS_Lib;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with i2c_interface_c; use i2c_interface_c;
with Interfaces.C; use Interfaces.C;
with Ada.IO_Exceptions;
with LSM9DS0; use LSM9DS0;
with LSM9DS1; use LSM9DS1;

with asm_generic_int_ll64_h; use asm_generic_int_ll64_h;



package body imu is
	LSM9DS0: Integer := -1;
	LSM9DS1: Integer := -1;
	fd : File_Descriptor := Invalid_FD;
	package charIO is new Ada.Text_IO.Modular_IO(uu_u8); use charIO;
procedure readMag(val:in out uu_s32) is
	function ioctl (FD : Interfaces.C.int;
                      Request : Interfaces.C.unsigned_long;
                      Address : Interfaces.C.int)
                     return Interfaces.C.int;
     	 pragma Import (C, ioctl, "ioctl");
      	use type Interfaces.C.int;
	result : uu_s32;

	block : array(Integer range 1 .. 6) of access uu_u8;
	one : aliased uu_u8 := uu_u8(1);
	two : aliased uu_u8 := uu_u8(1);
	three : aliased uu_u8 := uu_u8(1);
	four : aliased uu_u8 := uu_u8(1);
        five : aliased uu_u8 := uu_u8(1);
	six : aliased uu_u8 := uu_u8(1);
	
	ans : uu_u8 ;
	test1 : unsigned_char;
	test2 : unsigned_char;


begin
	
	block(1) := one'Access;
	block(2) := two'Access;
	block(3) := three'Access;
	block(4) := four'Access;
	block(5) := five'Access;
	block(6) := six'Access;

	if LSM9DS0 = 1 then
--		selectDevice(file,LSM9DS0_MAG_ADDRESS);
		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS0_MAG_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
          	 with "unable to set slave address for GYR";
        	end if;
--		readBlock(0x80 |  LSM9DS0_OUT_X_L_M, sizeof(block), block);
		Put("Before@");
		result := read_i2c_block_data(Interfaces.C.int(fd), uu_u8(LSM9DS0_OUT_X_L_M), uu_u8(block'Length), block(1));
      		Put("After");
	elsif LSM9DS1 = 1 then
--		selectDevice(file,LSM9DS1_MAG_ADDRESS);
		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS1_MAG_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
          	 with "unable to set slave address for GYR";
        	end if;
--		readBlock(0x80 |  LSM9DS1_OUT_X_L_M, sizeof(block), block); 
		result := read_i2c_block_data(Interfaces.C.int(fd), uu_u8(LSM9DS1_OUT_X_L_M), uu_u8(block'Length),  block(1));   
	end if;

--	// Combine readings for each axis.
	Put("Before val");
	--ans := block(1).all ;
	--ans := unsigned_char(block(1)) or unsigned_char(block(2));
	--val := uu_s32 (byte1 or byte2);
	Put("After");
	Put(block(1).all);
--	m[1] = (int16_t)(block[2] | block[3] << 8);
--	m[2] = (int16_t)(block[4] | block[5] << 8);
--}

end readMag;

procedure writeGyrReg(reg: uu_u8; value: uu_u8) is
	function ioctl (FD : Interfaces.C.int;
                      Request : Interfaces.C.unsigned_long;
                      Address : Interfaces.C.int)
                     return Interfaces.C.int;
     	 pragma Import (C, ioctl, "ioctl");
      	use type Interfaces.C.int;

	result: uu_s32;
begin
    	if LSM9DS0 = 1 then
		--selectDevice(file,LSM9DS0_GYR_ADDRESS);
		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS0_GYR_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
          	 with "unable to set slave address for GYR";
        	end if;
	elsif LSM9DS1 = 1 then
		--selectDevice(file,LSM9DS1_GYR_ADDRESS);
  		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS1_GYR_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
          	 with "unable to set slave address for GYR";
        	end if;
	end if;
	--int result = i2c_smbus_write_byte_data(file, reg, value);
	result := i2c_interface_c.write_byte_data(Interfaces.C.int(fd), reg, value);
	if result = -1 then
		Put_Line("Failed to write byte to I2C Gyr.");
		
	end if;
end writeGyrReg;

procedure writeMagReg(reg: uu_u8; value: uu_u8) is
	function ioctl (FD : Interfaces.C.int;
                      Request : Interfaces.C.unsigned_long;
                      Address : Interfaces.C.int)
                     return Interfaces.C.int;
     	 pragma Import (C, ioctl, "ioctl");
      	use type Interfaces.C.int;

	result: uu_s32;
begin
	if LSM9DS0 = 1 then
		--selectDevice(file,LSM9DS0_MAG_ADDRESS);
		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS0_MAG_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
          	 with "unable to set slave address for GYR";
        	end if;
	elsif LSM9DS1 = 1 then
		--selectDevice(file,LSM9DS1_MAG_ADDRESS);
  		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS1_MAG_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
          	 with "unable to set slave address for GYR";
        	end if;
	end if;
	--int result = i2c_smbus_write_byte_data(file, reg, value);
	result := i2c_interface_c.write_byte_data(Interfaces.C.int(fd), reg, value);
	if result = -1 then
		Put_Line("Failed to write byte to I2C Mag.");
		
	end if;
end writeMagReg;
procedure writeAccReg(reg: uu_u8; value: uu_u8) is
	function ioctl (FD : Interfaces.C.int;
                      Request : Interfaces.C.unsigned_long;
                      Address : Interfaces.C.int)
                     return Interfaces.C.int;
     	 pragma Import (C, ioctl, "ioctl");
      	use type Interfaces.C.int;

	result : asm_generic_int_ll64_h.uu_s32;
begin
	if LSM9DS0 = 1 then
		--selectDevice(file,LSM9DS0_ACC_ADDRESS);
		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS0_ACC_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
          	 with "unable to set slave address for GYR";
        	end if;
	elsif LSM9DS1 = 1 then
		--selectDevice(file,LSM9DS1_ACC_ADDRESS);
		if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS1_ACC_ADDRESS)) < 0 then
         	raise Ada.IO_Exceptions.Use_Error
           	with "unable to set slave address for GYR";
        	end if;
	end if;

	--int result = i2c_smbus_write_byte_data(file, reg, value);
	result := i2c_interface_c.write_byte_data(Interfaces.C.int(fd), reg, value);
	--if (result == -1){
	--	printf ("Failed to write byte to I2C Acc.");
	--	exit(1);
	--}
	if result = -1 then
		Put_Line("Failed to write byte to I2C Acc.");
	end if;
end writeAccReg;


procedure detectIMU is
	package mys32IO is new Ada.Text_IO.Integer_IO(asm_generic_int_ll64_h.uu_s32);
	use mys32IO;	

	block: array(1 .. i2c_dev_h.I2C_SMBUS_BLOCK_MAX) of uu_le16;--__u16 block[I2C_SMBUS_BLOCK_MAX];
	res, bus, size: Integer; --int res, bus,  size;
	filename: String := "/dev/i2c-1";--char filename[20];
						--sprintf(filename, "/dev/i2c-%d", 1);
	

        LSM9DS0_WHO_XM_response : asm_generic_int_ll64_h.uu_s32;
	LSM9DS0_WHO_G_response : asm_generic_int_ll64_h.uu_s32;
	LSM9DS1_WHO_M_response : asm_generic_int_ll64_h.uu_s32;
	LSM9DS1_WHO_XG_response : asm_generic_int_ll64_h.uu_s32;

	function ioctl (FD : Interfaces.C.int;
                      Request : Interfaces.C.unsigned_long;
                      Address : Interfaces.C.int)
                     return Interfaces.C.int;
      pragma Import (C, ioctl, "ioctl");
      use type Interfaces.C.int;

	
begin
	 

	
	block(1) := 0;
	
	fd := Open_Read_Write(Name => filename, Fmode => Binary);--file = open(filename, O_RDWR);

	if fd = Invalid_FD then--if (file<0) {
		put("Failed to open imu device!");--	printf("Unable to open I2C bus!");
	end if ;
	
--//Detect if BerryIMUv1 (Which uses a LSM9DS0) is connected  --selectDevice(file,LSM9DS0_ACC_ADDRESS);
       if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS0_ACC_ADDRESS)) < 0 then
         raise Ada.IO_Exceptions.Use_Error
           with "unable to set slave address for ACC";
        end if;
	
	--int LSM9DS0_WHO_XM_response = i2c_smbus_read_byte_data(file, LSM9DS0_WHO_AM_I_XM);
	LSM9DS0_WHO_XM_response :=  i2c_interface_c.read_byte_data(Interfaces.C.int(fd), asm_generic_int_ll64_h.uu_u8(LSM9DS0_WHO_AM_I_XM));

	--selectDevice(file,LSM9DS0_GYR_ADDRESS);
	if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS0_GYR_ADDRESS)) < 0 then
         raise Ada.IO_Exceptions.Use_Error
           with "unable to set slave address for GYR";
        end if;

	--int LSM9DS0_WHO_G_response = i2c_smbus_read_byte_data(file, LSM9DS0_WHO_AM_I_G);
	LSM9DS0_WHO_G_response := i2c_interface_c.read_byte_data(Interfaces.C.int(fd), asm_generic_int_ll64_h.uu_u8(LSM9DS0_WHO_AM_I_G));
	
	--if (LSM9DS0_WHO_G_response == 0xd4 && LSM9DS0_WHO_XM_response == 0x49){
	--	printf ("\n\n\n#####   BerryIMUv1/LSM9DS0  DETECTED    #####\n\n");
	--	LSM9DS0 = 1;
	--}
	if(LSM9DS0_WHO_G_response = 212 and LSM9DS0_WHO_XM_response = 73) then
		Put_Line("BerryIMUv1/LSM9DS0 detected");
		LSM9DS0 := 1;
	end if;

	--//Detect if BerryIMUv2 (Which uses a LSM9DS1) is connected
	--selectDevice(file,LSM9DS1_MAG_ADDRESS);
	if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS1_MAG_ADDRESS)) < 0 then
         raise Ada.IO_Exceptions.Use_Error
           with "unable to set slave address for GYR";
        end if;

	--int LSM9DS1_WHO_M_response = i2c_smbus_read_byte_data(file, LSM9DS1_WHO_AM_I_M);
	LSM9DS1_WHO_M_response := i2c_interface_c.read_byte_data(Interfaces.C.int(fd), asm_generic_int_ll64_h.uu_u8(LSM9DS1_WHO_AM_I_M));

	--selectDevice(file,LSM9DS1_GYR_ADDRESS);
	if ioctl (Interfaces.C.int(fd),   
                i2c_dev_h.I2C_SLAVE,
                Interfaces.C.int(LSM9DS1_GYR_ADDRESS)) < 0 then
         raise Ada.IO_Exceptions.Use_Error
           with "unable to set slave address for GYR";
        end if;	
	--int LSM9DS1_WHO_XG_response = i2c_smbus_read_byte_data(file, LSM9DS1_WHO_AM_I_XG);
	LSM9DS1_WHO_XG_response := i2c_interface_c.read_byte_data(Interfaces.C.int(fd), asm_generic_int_ll64_h.uu_u8(LSM9DS1_WHO_AM_I_XG));

   -- if (LSM9DS1_WHO_XG_response == 0x68 && LSM9DS1_WHO_M_response == 0x3d){
	--	printf ("\n\n\n#####   BerryIMUv2/LSM9DS1  DETECTED    #####\n\n");
	--	LSM9DS1 = 1;
	--}
  	if LSM9DS1_WHO_XG_response = 16#68# and LSM9DS1_WHO_M_response = 16#3d# then
		LSM9DS1 := 1;
		Put_Line( "BerryIMUv2/LSM9DS1 detected!");
	end if;


	--if (!LSM9DS0 && !LSM9DS1){
	--	printf ("NO IMU DETECTED\n");
	--	exit(1);
	--}
	if LSM9DS0 /= 1 and LSM9DS1 /= 1 then
		Put_Line("No IMU detected");
	end if;

end detectIMU;


procedure enableIMU is
begin
	if LSM9DS0 = 1 then
		-- Enable accelerometer.
		writeAccReg(uu_u8(LSM9DS0_CTRL_REG1_XM), 2#01100111#); --  z,y,x axis enabled, continuous update,  100Hz data rate
		writeAccReg(uu_u8(LSM9DS0_CTRL_REG1_XM), 2#01100111#); --  z,y,x axis enabled, continuous update,  100Hz data rate
		writeAccReg(uu_u8(LSM9DS0_CTRL_REG2_XM), 2#00100000#); -- +/- 16G full scale

		--Enable the magnetometer
		writeMagReg(uu_u8(LSM9DS0_CTRL_REG5_XM), 2#11110000#); -- Temp enable, M data rate = 50Hz
		writeMagReg(uu_u8(LSM9DS0_CTRL_REG6_XM), 2#01100000#); -- +/-12gauss
		writeMagReg(uu_u8(LSM9DS0_CTRL_REG7_XM), 2#00000000#); -- Continuous-conversion mode

		-- Enable Gyro
		writeGyrReg(uu_u8(LSM9DS0_CTRL_REG1_G), 2#00001111#); -- Normal power mode, all axes enabled
		writeGyrReg(uu_u8(LSM9DS0_CTRL_REG4_G), 2#00110000#); -- Continuos update, 2000 dps full scale
		Put_Line("All LSM9DS0 registers enabled.");

	end if;

	if LSM9DS1 = 1 then  --For BerryIMUv2
		-- Enable the gyroscope
		writeGyrReg(uu_u8(LSM9DS1_CTRL_REG4),2#00111000#);      -- z, y, x axis enabled for gyro
		writeGyrReg(uu_u8(LSM9DS1_CTRL_REG1_G),2#10111000#);    --// Gyro ODR = 476Hz, 2000 dps
		writeGyrReg(uu_u8(LSM9DS1_ORIENT_CFG_G),2#10111000#);   --// Swap orientation 

		-- Enable the accelerometer
		writeAccReg(uu_u8(LSM9DS1_CTRL_REG5_XL),2#00111000#);   --// z, y, x axis enabled for accelerometer
		writeAccReg(uu_u8(LSM9DS1_CTRL_REG6_XL),2#00101000#);   --// +/- 16g

		--Enable the magnetometer
		writeMagReg(uu_u8(LSM9DS1_CTRL_REG1_M), 2#10011100#);   --// Temp compensation enabled,Low power mode mode,80Hz ODR
		writeMagReg(uu_u8(LSM9DS1_CTRL_REG2_M), 2#01000000#);   --// +/-12gauss
		writeMagReg(uu_u8(LSM9DS1_CTRL_REG3_M), 2#00000000#);   --// continuos update
		writeMagReg(uu_u8(LSM9DS1_CTRL_REG4_M), 2#00000000#);   --// lower power mode for Z axis
		Put_Line("All LSM9DS1 registers enabled.");
	end if;

end enableIMU;


end imu;
