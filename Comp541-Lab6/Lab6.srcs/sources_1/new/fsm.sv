`timescale 1ns / 1ps

module fsm(
    input clk,
    input up, center, down,
    output reg countup, paused
    );
    
    reg [2:0] state = 3'b000;	// S is the number of state bits; can be initialized
    reg [2:0] next_state;	// next_state is actually not a register! Must be
				//   synthesized as combinational logic!
    localparam COUNTUP = 3'b000, COUNTDN = 3'b0001, PAUSEUP = 3'b010, PAUSEDN = 3'b011,
                PAUSINGUP = 3'b100, RESUMINGUP = 3'b101, PAUSINGDN = 3'b110, RESUMINGDN = 3'b111;


    always_ff @(posedge clk)	
        state <= next_state;
        				// Define next_state logic => combinational
		 		// Every case must either be a conditional expression
    always_comb  		//   or an "if" with a matching "else"
      case (state)
            COUNTUP: next_state <= (center == 1) ? PAUSINGUP  : ((down == 1) ? COUNTDN : COUNTUP );
            PAUSEUP: next_state <= (center == 1) ? RESUMINGUP : ((down == 1) ? PAUSEDN : PAUSEUP );
            COUNTDN: next_state <= (center == 1) ? PAUSINGDN  : ((up == 1) ? COUNTUP : COUNTDN );
            PAUSEDN: next_state <= (center == 1) ? RESUMINGDN : ((up == 1) ? PAUSEUP : PAUSEDN );
            PAUSINGUP: next_state <= (center == 0) ? PAUSEUP : PAUSINGUP;
            RESUMINGUP: next_state <= (center == 0) ? COUNTUP : RESUMINGUP;
            PAUSINGDN: next_state <= (center == 0) ? PAUSEDN : PAUSINGDN;
            RESUMINGDN: next_state <= (center == 0) ? COUNTDN : RESUMINGDN;
      endcase

    always_comb  		//   or an "if" with a matching "else"
        case (state)
              COUNTUP: begin countup <= 1; paused <= 0; end
              PAUSEUP: begin countup <= 1; paused <= 1; end
              COUNTDN: begin countup <= 0; paused <= 0; end
              PAUSEDN: begin countup <= 0; paused <= 1; end
              PAUSINGUP: begin countup <= 1; paused <= 1; end
              RESUMINGUP: begin countup <= 1; paused <= 0; end
              PAUSINGDN: begin countup <= 0; paused <= 1; end
              RESUMINGDN: begin countup <= 0; paused <= 0; end         
        endcase

endmodule