`timescale 1ns / 1ps

module debouncer(
    input raw,
    input clk,
    output reg clean = 0
    );
    
    localparam N = 20;
    reg [N:0] count;
    
    always_ff @(posedge clk) begin
        count <= (raw != clean ) ? count + 1'b1 : 0;
        clean <= (count[N] == 1) ? raw : clean;
    end
endmodule
