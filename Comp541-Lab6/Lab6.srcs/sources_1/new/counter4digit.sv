`timescale 1ns / 1ps

module counter4digit(
    input X,
    input clk,
    output reg [7:0] digitselect,
    output [7:0] segments
    );
    
    seebounce (
        .X( X ),
        .clk( clk ),
        .segments( segments ),
        .digitselect( digitselect )
    );
endmodule
