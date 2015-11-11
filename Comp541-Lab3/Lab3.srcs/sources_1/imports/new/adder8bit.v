`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2015 10:42:38 AM
// Design Name: 
// Module Name: adder8bit
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


module adder8bit(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] Sum,
    output Cout
    );
    
    wire C3;
    adder4bit A0(A[3:0], B[3:0], Cin, Sum[3:0], C3);
    adder4bit A1(A[7:4], B[7:4], C3, Sum[7:4], Cout);

endmodule
