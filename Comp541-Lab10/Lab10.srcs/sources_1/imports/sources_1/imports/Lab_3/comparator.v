`timescale 1ns / 1ps

module comparator( 
        input FlagN, FlagV, FlagC, bool0,
        output comparison
        );
        
        assign comparison = (bool0 == 0) ? (FlagN && ~FlagV) || (~FlagN && FlagV) : ~FlagC;
endmodule
