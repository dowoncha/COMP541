`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2015 10:32:48 PM
// Design Name: 
// Module Name: xycounter
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


module xycounter #(parameter width=2, height=2) (
    input clock,
    input enable,
    output reg [$clog2(width)-1:0] x = 0,
    output reg [$clog2(height)-1:0] y = 0
    );
    
    always_ff @(posedge clock)
    begin
        if (enable)
        begin
            if (x == width - 1)
            begin
                x = 0;
                y = y + 1;
                if (y == height)
                    y = 0;
            end
            else
                x = x + 1;
        end
    end
endmodule
