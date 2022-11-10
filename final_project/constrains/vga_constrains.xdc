When the video_on signal is asserted from the vga_sync_unit, we route the states of the input switches to rgb_reg, which is tied to the rgb color signal outputs.

# clock pins for Basys2 Board
NET "clk" LOC = "B8"; # Bank = 0, Signal name = MCLK

NET "reset" LOC = "A7";  # Bank = 1, Signal name = BTN3

# Pin assignment for SWs
NET "sw[7]" LOC = "N3";  # Bank = 2, Signal name = SW7
NET "sw[6]" LOC = "E2";  # Bank = 3, Signal name = SW6
NET "sw[5]" LOC = "F3";  # Bank = 3, Signal name = SW5
NET "sw[4]" LOC = "G3";  # Bank = 3, Signal name = SW4
NET "sw[3]" LOC = "B4";  # Bank = 3, Signal name = SW3
NET "sw[2]" LOC = "K3";  # Bank = 3, Signal name = SW2
NET "sw[1]" LOC = "L3";  # Bank = 3, Signal name = SW1
NET "sw[0]" LOC = "P11";  # Bank = 2, Signal name = SW0

### Pin assignment for VGA
NET "hsync"   LOC = "J14"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = HSYNC
NET "vsync"   LOC = "K13"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = VSYNC

NET "rgb[7]"   LOC = "F13"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = RED2
NET "rgb[6]"   LOC = "D13"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = RED1
NET "rgb[5]"   LOC = "C14"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = RED0
NET "rgb[4]" LOC = "G14"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = GRN2
NET "rgb[3]" LOC = "G13"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = GRN1
NET "rgb[2]" LOC = "F14"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = GRN0
NET "rgb[1]"  LOC = "J13"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = BLU2
NET "rgb[0]"  LOC = "H13"  | DRIVE = 2  | PULLUP ; # Bank = 1, Signal name = 