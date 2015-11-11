`timescale 1ns / 1ps 

module comb(
        input [3:0] D,
        input left, right, up, down, center,
        input [3:0] dout,
        output [3:0] din      
    );
    
    assign din = (center == 1) ? 0 
                 : (up == 1) ? ( dout + 1 )
                 : (down == 1) ? ( dout - 1 )
                 : (left == 1) ? ( dout & D )
                 : (right == 1) ? ( dout | D ) : 0;
        
endmodule
