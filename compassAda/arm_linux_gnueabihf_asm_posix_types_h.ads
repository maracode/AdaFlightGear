with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package arm_linux_gnueabihf_asm_posix_types_h is

  -- *  arch/arm/include/asm/posix_types.h
  -- *
  -- *  Copyright (C) 1996-1998 Russell King.
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License version 2 as
  -- * published by the Free Software Foundation.
  -- *
  -- *  Changelog:
  -- *   27-06-1996	RMK	Created
  --  

  -- * This file is generally used by user-level software, so you need to
  -- * be a little careful about namespace pollution etc.  Also, we cannot
  -- * assume GCC is being used.
  --  

   subtype uu_kernel_ino_t is unsigned_long;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:22

   subtype uu_kernel_mode_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:23

   subtype uu_kernel_nlink_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:24

   subtype uu_kernel_off_t is long;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:25

   subtype uu_kernel_pid_t is int;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:26

   subtype uu_kernel_ipc_pid_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:27

   subtype uu_kernel_uid_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:28

   subtype uu_kernel_gid_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:29

   subtype uu_kernel_size_t is unsigned;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:30

   subtype uu_kernel_ssize_t is int;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:31

   subtype uu_kernel_ptrdiff_t is int;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:32

   subtype uu_kernel_time_t is long;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:33

   subtype uu_kernel_suseconds_t is long;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:34

   subtype uu_kernel_clock_t is long;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:35

   subtype uu_kernel_timer_t is int;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:36

   subtype uu_kernel_clockid_t is int;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:37

   subtype uu_kernel_daddr_t is int;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:38

   type uu_kernel_caddr_t is new Interfaces.C.Strings.chars_ptr;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:39

   subtype uu_kernel_uid16_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:40

   subtype uu_kernel_gid16_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:41

   subtype uu_kernel_uid32_t is unsigned;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:42

   subtype uu_kernel_gid32_t is unsigned;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:43

   subtype uu_kernel_old_uid_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:45

   subtype uu_kernel_old_gid_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:46

   subtype uu_kernel_old_dev_t is unsigned_short;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:47

   subtype uu_kernel_loff_t is Long_Long_Integer;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:50

   type uu_kernel_fsid_t_val_array is array (0 .. 1) of aliased int;
   type uu_kernel_fsid_t is record
      val : aliased uu_kernel_fsid_t_val_array;  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:54
   end record;
   pragma Convention (C_Pass_By_Copy, uu_kernel_fsid_t);  -- /usr/include/arm-linux-gnueabihf/asm/posix_types.h:55

end arm_linux_gnueabihf_asm_posix_types_h;
