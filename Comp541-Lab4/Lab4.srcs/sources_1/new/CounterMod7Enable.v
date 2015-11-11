`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2015 10:07:55 PM
// Design Name: 
// Module Name: CounterMod7
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


module CounterMod7Enable(
    input clock,
    input reset,
    input enable,
    output reg[2:0] value
    );
    
    always_ff @(posedge clock) 
    begin
        value <= reset ? 0 : (value == 101 ) ? 0 : enable ? value + 1 : value;
    end
    
endmodule
