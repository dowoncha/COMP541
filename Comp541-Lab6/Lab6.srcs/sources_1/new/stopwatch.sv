`timescale 1ns / 1ps

module stopwatch(
        input clk,
        input BTNU, BTNC, BTND,
        output [7:0] segments,
        output [7:0] digitselect
        );
        
        wire up, center, down;
        wire countup, paused;
        wire [15:0] value;
        
        debouncer debounceUp(
            .raw( BTNU ),
            .clk( clk ),
            .clean( up )
        );
        
        debouncer debounceDown(
            .raw( BTND ),
            .clk( clk ),
            .clean( down )
        );
                
        debouncer debounceCenter(
            .raw( BTNC ),
            .clk( clk ),
            .clean( center )
        );
        
        fsm fsm_1(
            .clk( clk ),
            .up( up ),
            .center( center ),
            .down( down),
            .countup( countup ),
            .paused( paused )
         );
         
         counter counter_1(
            .clk( clk ),
            .countup( countup ),
            .paused( paused ),
            .value( value )
         );
         
         display4digit display(
            .val( value ),
            .clk( clk ),
            .segments( segments ),
            .digitselect( digitselect )
         );
         
endmodule