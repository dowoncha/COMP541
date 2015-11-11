`timescale 1ns / 1ps

module counter(
    input clk,
    input countup,
    input paused,
    output [15:0] value
    );
    
    reg [63:0] cnt = 0;
    
    always_ff @(posedge clk)
    begin
        if (~paused)
            cnt <= (countup) ? cnt + 1 : cnt - 1;
    end
    
    assign value = cnt[38:23];
    
endmodule
