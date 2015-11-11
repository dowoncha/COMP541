`timescale 1ns / 1ps

module mux2 #(parameter N=32) (
        input [N-1:0] n1, n2,
        input check,
        output y
    );
    
    assign y = check ? n2 : n1;
    
endmodule
