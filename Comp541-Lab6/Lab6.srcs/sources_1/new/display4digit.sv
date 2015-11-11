`timescale 1ns / 1ps

module display4digit(
    input [15:0] val,
    input clk,
    output [7:0] segments,
    output reg [7:0] digitselect
    );

	reg [31:0] counter = 0;
	wire [1:0] toptwo;
	reg [3:0] value4bit;
	
	always_ff @(posedge clk)
		counter <= counter + 1'b1;
	
	assign toptwo[1:0] = counter[18:17];
	
	always_comb
        case ( toptwo )
           2'b00: digitselect[3:0] <= ~ 4'b0001;
           2'b01: digitselect[3:0] <= ~ 4'b0010;
           2'b10: digitselect[3:0] <= ~ 4'b0100;
           default: digitselect[3:0] <= ~4'b1000;
        endcase
	
	assign digitselect[7:4] = ~ 4'b0000;      // Since we are not using half of the display
		
    always_comb
        case ( toptwo )
           2'b00: value4bit <= val[3:0];
           2'b01: value4bit <= val[7:4];
           2'b10: value4bit <= val[11:8];
           default: value4bit <= val[15:12];
        endcase
    
	hexto7seg myhexencoder(value4bit, segments);

endmodule