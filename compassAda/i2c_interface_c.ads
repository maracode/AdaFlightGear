with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package i2c_interface_c is

   function read_byte_data (file : int; command : asm_generic_int_ll64_h.uu_u8) return asm_generic_int_ll64_h.uu_s32;  -- i2c_interface.c:3
   pragma Import (C, read_byte_data, "read_byte_data");

function write_byte_data
     (file : int;
      command : asm_generic_int_ll64_h.uu_u8;
      value : asm_generic_int_ll64_h.uu_u8) return asm_generic_int_ll64_h.uu_s32;  -- i2c_interface.c:52
   pragma Import (C, write_byte_data, "write_byte_data");

 function read_i2c_block_data
     (file : int;
      command : asm_generic_int_ll64_h.uu_u8;
      length : asm_generic_int_ll64_h.uu_u8;
      values : access asm_generic_int_ll64_h.uu_u8) return asm_generic_int_ll64_h.uu_s32;  -- i2c_interface.c:90
   pragma Import (C, read_i2c_block_data, "read_i2c_block_data");

end i2c_interface_c;
