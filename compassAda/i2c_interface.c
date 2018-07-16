#include <linux/i2c-dev.h>

__s32 read_byte_data(int file, __u8 command)
{
  return i2c_smbus_read_byte_data(file, command);
}

__s32 write_byte_data(int file, __u8 command, __u8 value)
{
  return i2c_smbus_write_byte_data(file, command, value);
}

__s32 read_i2c_block_data(int file,
                          __u8 command,
                          __u8 length,
                          __u8 *values)
{
  return i2c_smbus_read_i2c_block_data(file, command, length, values);
}

