`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2015 06:03:14 PM
// Design Name: 
// Module Name: comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparator( 
        input FlagN, FlagV, FlagC, bool0,
        output comparison
        );
        
        assign comparison = (bool0 == 0) ? (FlagN && ~FlagV) || (~FlagN && FlagV) : ~FlagC;
endmodule
