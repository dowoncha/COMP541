`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Engineer:  Montek Singh
// Create Date:    3/3/2015 
//
//////////////////////////////////////////////////////////////////////////////////

module ram #(
   parameter Abits = 4,        // Number of bits in address
   parameter Dbits = 4,        // Number of bits in data
   parameter Nloc = 16         // Number of memory locations
   )(
   input clock,
   input wr,                   // WriteEnable:  if wr==1, data is written into mem
   input [Abits-1 : 0] addr,   // Address for specifying memory location
   input [Dbits-1 : 0] din,    // Data for writing into memory (if wr==1)
   output [Dbits-1 : 0] dout   // Data read from memory (all the time)
   );
   
   
   reg [Dbits-1 : 0] mem [Nloc-1 : 0];   // The actual registers where data is stored
   
   always_ff @(posedge clock)     // Memory write: only when wr==1, and only at posedge clock
      if(wr)
         mem[addr] <= din;
   
   assign dout = mem[addr];       // Memory read: read all the time, no clock involved
   
endmodule