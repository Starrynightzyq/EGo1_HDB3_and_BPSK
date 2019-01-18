connect -url tcp:127.0.0.1:3121
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "xilinx tul 1234-tulA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "xilinx tul 1234-tulA"} -index 0
dow D:/Verliog_Project/sdk_vga_test6_fuben2/sdk_vga_test6_fuben2.sdk/vga/Debug/vga.elf
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "xilinx tul 1234-tulA"} -index 0
con
