`timescale 1ns / 1ps

module debouncer(
    input raw,
    input clk,
    output reg clean = 0
    );
    
    localparam N = 20;
    reg [N:0] count;
    
    always_ff @(posedge clk) begin
        count <= (raw != clean ) ? 0 : count + 1'b1;
        clean <= (count[N] == 1) ? 1'b1 : 0'b1;
    end
endmodule
