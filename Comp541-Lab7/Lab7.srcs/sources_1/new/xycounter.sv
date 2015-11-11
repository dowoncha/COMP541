`timescale 1ns / 1ps

module xycounter #(parameter width=2, height=2) (
        input clk,
        input enable,
        output reg [$clog2(width) - 1:0] x = 0,
        output reg [$clog2(height) - 1:0] y = 0
        );
        
        always_ff @(posedge clk)
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
            