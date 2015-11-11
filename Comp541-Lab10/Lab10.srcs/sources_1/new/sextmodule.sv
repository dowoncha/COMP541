`timescale 1ns / 1ps

module sextmodule(
        input [31:0] instr,
        input sext,
        output [31:0] sextoutput
    );
    
    assign sextoutput = (sext == 1) ? instr[15:0] >>> 16 : instr[15:0] >> 16; 
endmodule
