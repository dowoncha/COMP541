
## Clock
set_property PACKAGE_PIN E3 [get_ports clock]						
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

## Switches
set_property PACKAGE_PIN U9 [get_ports {D[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {D[0]}]
set_property PACKAGE_PIN U8 [get_ports {D[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {D[1]}]
set_property PACKAGE_PIN R7 [get_ports {D[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {D[2]}]
set_property PACKAGE_PIN R6 [get_ports {D[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {D[3]}]

set_property PACKAGE_PIN R5 [get_ports {Addr[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Addr[0]}]
set_property PACKAGE_PIN V7 [get_ports {Addr[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Addr[1]}]
set_property PACKAGE_PIN V6 [get_ports {Addr[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Addr[2]}]
set_property PACKAGE_PIN V5 [get_ports {Addr[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Addr[3]}]

## Buttons
set_property PACKAGE_PIN T16 [get_ports btnL]						
set_property IOSTANDARD LVCMOS33 [get_ports btnL]
set_property PACKAGE_PIN R10 [get_ports btnR]						
set_property IOSTANDARD LVCMOS33 [get_ports btnR]
set_property PACKAGE_PIN F15 [get_ports btnU]
set_property IOSTANDARD LVCMOS33 [get_ports btnU]
set_property PACKAGE_PIN V10 [get_ports btnD]
set_property IOSTANDARD LVCMOS33 [get_ports btnD]
set_property PACKAGE_PIN E16 [get_ports btnC]
set_property IOSTANDARD LVCMOS33 [get_ports btnC]

##7 segment display
set_property PACKAGE_PIN L3 [get_ports {segments[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[7]}]
set_property PACKAGE_PIN N1 [get_ports {segments[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]
set_property PACKAGE_PIN L5 [get_ports {segments[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property PACKAGE_PIN L4 [get_ports {segments[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property PACKAGE_PIN K3 [get_ports {segments[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property PACKAGE_PIN M2 [get_ports {segments[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property PACKAGE_PIN L6 [get_ports {segments[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property PACKAGE_PIN M4 [get_ports {segments[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]

set_property PACKAGE_PIN N6 [get_ports {digitselect[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[0]}]
set_property PACKAGE_PIN M6 [get_ports {digitselect[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[1]}]
set_property PACKAGE_PIN M3 [get_ports {digitselect[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[2]}]
set_property PACKAGE_PIN N5 [get_ports {digitselect[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[3]}]
set_property PACKAGE_PIN N2 [get_ports {digitselect[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[4]}]
set_property PACKAGE_PIN N4 [get_ports {digitselect[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[5]}]
set_property PACKAGE_PIN L1 [get_ports {digitselect[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[6]}]
set_property PACKAGE_PIN M1 [get_ports {digitselect[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {digitselect[7]}]
