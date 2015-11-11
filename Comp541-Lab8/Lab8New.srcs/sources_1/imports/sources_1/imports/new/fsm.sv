`timescale 1ns / 1ps

module fsm(
    input clk,
    input left, right, up, down, center,
    output reg wr
    ); 
    
    reg [2:0] state = 2'b00;	// S is the number of state bits; can be initialized
    reg [2:0] next_state;	// next_state is actually not a register! Must be
    
    localparam BUTTONUP = 2'b00, TRANSITION = 2'b01, BUTTONDOWN = 2'b10;

    always_ff @(posedge clk)	
        state <= next_state;
        
    always_comb
        case (state)
            BUTTONUP: next_state <= ((left | right | up | down | center) == 1) ? TRANSITION : BUTTONUP;
            TRANSITION: next_state <= BUTTONDOWN;
            BUTTONDOWN: next_state <= ((left | right | up | down | center) == 0) ? BUTTONUP : BUTTONDOWN;
            default: next_state <= BUTTONUP;
       endcase

    always_comb 
        case (state)
            BUTTONUP: wr = 0;
            TRANSITION: wr = 1;
            BUTTONDOWN: wr = 0;
            default: wr = 0;
        endcase
endmodule