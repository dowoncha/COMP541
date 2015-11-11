`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Montek Singh
// 2/17/2015 
//
//////////////////////////////////////////////////////////////////////////////////

`include "display640x480.sv"

module vgadisplaydriver(
    input clk,
    output [3:0] red, green, blue,
    output hsync, vsync
    );

   wire [`xbits-1:0] x;
   wire [`ybits-1:0] y;
   reg [11:0] colorcounter = 0;

   vgatimer myvgatimer(clk, hsync, vsync, activevideo, x, y);
   
   always_ff @(posedge clk)
        colorcounter <= colorcounter + 1;
   
   // For Nexys 4, use the following to generate a 12-bit color pattern
   assign red[3:0]   = (activevideo == 1) ? colorcounter[11:8] : 4'b0;
   assign green[3:0] = (activevideo == 1) ? colorcounter[7:4] : 4'b0;
   assign blue[3:0]  = (activevideo == 1) ? colorcounter[3:0] : 4'b0;

endmodule