`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2015 09:47:56 PM
// Design Name: 
// Module Name: CounterMod4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CounterMod4(
    input clock,
    input reset,
    output reg[1:0] value = 0
    );
    
    always_ff @(posedge clock) 
    begin
        value <= reset ? 2'b 00 : (value + 1);
    end
        
endmodule
