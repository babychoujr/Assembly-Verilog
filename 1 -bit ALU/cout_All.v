`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 01:40:31 PM
// Design Name: 
// Module Name: cout_All
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


module cout_All(adderCout, subBorrowCout, subCout, incrementCout, decrementCout, addIncrementCout, shiftCout, opsel, mode, cout);
    input adderCout, subBorrowCout, subCout, incrementCout, decrementCout, addIncrementCout, shiftCout, mode;
    input [2:0] opsel;
    output cout;
    
    reg temp;
        
    always @ (mode or opsel)
    begin
         case({mode, opsel})
             4'b0000:
               temp = adderCout;
             4'b0001:
               temp = subBorrowCout;
             4'b0010:
               temp = 1'b0;
             4'b0011:
               temp = subCout;
             4'b0100:
               temp = incrementCout;
             4'b0101:
               temp = decrementCout;
             4'b0110:
               temp = addIncrementCout;
             4'b1000:
               temp = 1'b0;
             4'b1001:
               temp = 1'b0;
             4'b1010:
               temp = 1'b0;
             4'b1011:
               temp = 1'b0;
             4'b1101:
               temp = shiftCout;
             default:
               temp = 1'b0;
        endcase
                 
     end
     assign cout = temp;
endmodule
