`timescale 1ns / 1ps

module dmem #(
   parameter Abits = 32,        // Number of bits in address
   parameter Dbits = 32,        // Number of bits in data
   parameter Nloc = 32,         // Number of memory locations
   parameter dmem_init
   )(
   input clk,
   input wr,                   // WriteEnable:  if wr==1, data is written into mem
   input [Abits-1 : 0] addr,   // Address for specifying memory location
   input [Dbits-1 : 0] din,    // Data for writing into memory (if wr==1)
   output [Dbits-1 : 0] dout   // Data read from memory (all the time)
   );
   
   reg [Dbits-1 : 0] mem [Nloc-1 : 0];   // The actual registers where data is stored
   initial $readmemh(dmem_init, mem, 0, Nloc-1);
   
   always_ff @(posedge clk)     // Memory write: only when wr==1, and only at posedge clock
      if(wr)
         mem[addr >> 2] <= din;
   
   assign dout = mem[addr >> 2];       // Memory read: read all the time, no clock involved
   
endmodule