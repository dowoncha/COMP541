`timescale 1ns / 1ps
    
module datapath #(
    parameter Abits = 32,          // Number of bits in address
    parameter Dbits = 32,         // Number of bits in data
    parameter Nloc = 32           // Number of memory locations
    )(
    input clk,
    input reset,
    output reg [31:0] pc = 32'b0,
    input [31:0] instr, 
    
    input werf,
    input [1:0] pcsel, wasel, wdsel, asel,
    input [4:0] ALUFN,
    input bsel, sext,
    
    output reg [Abits-1 : 0] mem_addr,    
    output [Dbits-1 : 0] mem_writedata,
    input [Dbits-1:0] mem_readdata,                        
    output Z
    );     
                    
    wire [31:0] Imm;                    
    wire [31:0] signImm;  
    wire [Dbits-1:0] ReadData1, ReadData2;     
    reg [Dbits-1:0] reg_writedata;
    reg [4:0] reg_writeaddr; 
    wire [Dbits-1:0] aluA, aluB;
    wire [Dbits-1:0] alu_result;
    wire [Dbits-1:0] BT;
    wire [31:0] pcPlus4;
    wire [31:0] newPC;
    
    assign newPC = (pcsel == 2'b11) ? ReadData1 : 
                   (pcsel == 2'b10) ? {pc[31:28],instr[25:0],2'b00} :
                   (pcsel == 2'b01) ? BT :
                   pcPlus4; 
                   
    always_ff @(posedge clk)
    begin
        if (reset)
            pc <= 0;
        else
            pc <= newPC;
    end
    
    assign pcPlus4 = pc + 4;
    
    assign reg_writeaddr = (wasel == 2'b10) ? 5'b11111 :
                           (wasel == 2'b01) ? instr[20:16] :
                           instr[15:11];
    register_file rf(
        .clock( clk ),
        .wr( werf ),
        .ReadAddr1( instr[25:21] ),
        .ReadAddr2( instr[20:16] ),
        .WriteAddr( reg_writeaddr ),
        .WriteData( reg_writedata ),
        .ReadData1( ReadData1 ),
        .ReadData2( ReadData2 )
        );
     
     assign mem_writedata = ReadData2;   
     assign Imm = instr[15:0];
     
     assign aluA = (asel == 2'b10) ? {5'b10000} : 
                   (asel == 2'b01) ? instr[10:6]:
                   ReadData1;
                   
    assign signImm = (sext == 1 & Imm[31] == 1) ? {16'b1111111111111111, Imm[31:16]} : {16'b0, Imm[31:16]};
    
     //sextmodule sext_1( .instr( {Imm[15:0],16'b0} ), .sext( sext ), .sextoutput( signImm ));
                   
     assign aluB = (bsel == 1'b1) ? signImm : ReadData2;                    
          
     addsub bqeadder(.A( pcPlus4), .B(signImm << 2), .Subtract(1'b0), .Result(BT));
        
     ALU #(32) alu_1(
        .A( aluA ),
        .B( aluB ),
        .ALUfn( ALUFN ),
        .R(alu_result),
        .FlagZ( Z ));
        
     assign mem_addr = alu_result;
     
     assign reg_writedata = (wdsel == 2'b10) ? mem_readdata :
                            (wdsel == 2'b01) ? alu_result :
                            pcPlus4;
     
endmodule
