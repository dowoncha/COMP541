`timescale 1ns / 1ps

module memdemo(
        input clock,
        input btnL, btnR, btnU, btnD, btnC,
        input [3:0] Addr,
        input [3:0] D,
        output reg [7:0] digitselect = ~(8'b0000_0001),
        output [7:0] segments
    );
    
    wire left, right, up, down, center;
    wire wr;
    wire [3:0] dout;
    wire [3:0] din;
    
    debouncer debounceL(
        .raw( btnL ),
        .clk( clock ),
        .clean( left )        
    );
    
    debouncer debounceR(
            .raw( btnR ),
            .clk( clock ),
            .clean( right )        
    );
    
    debouncer debounceU(
        .raw( btnU ),
        .clk( clock ),
        .clean( up )        
    );
        
    debouncer debounceD(
        .raw( btnD ),
        .clk( clock ),
        .clean( down )        
    );
            
     debouncer debounceC(
        .raw( btnC ),
        .clk( clock ),
        .clean( center )        
    );
   
    comb comb_1(
        .D( D ),
        .left( left ),
        .right( right ),
        .up( up ),
        .down( down ),
        .center( center ),        
        .dout( dout ),
        .din( din )  
    );    
    
    fsm fsm_1(
        .clk( clock ),
        .left( left ),
        .right( right ),
        .down( down ),
        .up( up ),
        .center( center ),
        .wr( wr )
    );
    
    ram ram_1(
       .clock( clock ),
       .wr( wr ),          
       .addr( Addr ),   
       .din( din ),    
       .dout( dout )   
    );
    
    hexto7seg display_1(
        .X( dout ),
        .segments( segments)
    );
    
endmodule