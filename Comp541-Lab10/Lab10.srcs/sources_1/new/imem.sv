`timescale 1ns / 1ps

module imem #(
   parameter Abits = 32,        // Number of bits in address
   parameter Dbits = 32,        // Number of bits in data
   parameter Nloc = 32,         // Number of memory locations
   parameter imem_init
   )(
   input [31:0] pc,
   output [31:0] instr
   );
   
   reg [Dbits-1 : 0] mem [Nloc-1 : 0];   // The actual registers where data is stored
   initial $readmemh(imem_init, mem, 0, Nloc-1);
   
   assign instr = mem[ pc >> 2];
endmodule