`timescale 1ns / 1ps

module mips(
    input clk, 
    input reset, 
    output [31:0] pc,
    input [31:0] instr,  
    output mem_wr, 
    output [31:0] mem_addr,
    output [31:0] mem_writedata, 
    input [31:0] mem_readdata
    );
    
   wire [1:0] pcsel, wdsel, wasel, asel;
   wire [4:0] alufn;
   wire Z, sext, bsel, dmem_wr, werf;

    assign mem_wr = dmem_wr; 

   controller c(
        .op(instr[31:26]),
        .func(instr[5:0]), 
        .Z(Z),
        .pcsel(pcsel), .wasel(wasel), .sext(sext), .bsel(bsel), 
        .wdsel(wdsel), .alufn(alufn), .wr(dmem_wr), .werf(werf), .asel(asel));

   datapath dp( .clk(clk), .reset(reset), 
                  .pc(pc), .instr(instr),
                  .pcsel(pcsel),.wasel(wasel), .sext(sext), .asel(asel), .bsel(bsel), 
                  .werf(werf), .wdsel(wdsel), .ALUFN(alufn),
                  .Z(Z), 
                  .mem_addr(mem_addr), 
                  .mem_writedata(mem_writedata), 
                  .mem_readdata(mem_readdata));
endmodule