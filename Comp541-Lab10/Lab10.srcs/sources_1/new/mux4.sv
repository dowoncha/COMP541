`timescale 1ns / 1ps 

module mux4 #(parameter N=32)
    (    
        input [N-1:0] n1, n2, n3, n4,
        input [1:0] check,
        output reg [N-1:0] y
    );
    
    always_comb
        case (check)
            2'b00: y <= n1;
            2'b01: y <= n2;
            2'b10: y <= n3;
            2'b11: y <= n4;
        endcase    
endmodule
