`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Montek Singh
// 
// Create Date:    2/11/2015 
//////////////////////////////////////////////////////////////////////////////////

module seebounce(
    input X,
    input clk,
    output [7:0] segments,
    output [7:0] digitselect
    );

   reg [15:0] numBounces = 0;
   
   debouncer(
        .raw( X ),
        .clk( clk ),
        .clean( X )
   ); 

   always_ff @(posedge X)
      numBounces <= numBounces + 1'b1;    // Let's count number of bounces

   display4digit mydisplay(numBounces, clock, segments, digitselect);
		
endmodule