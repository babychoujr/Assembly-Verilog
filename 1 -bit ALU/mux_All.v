`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 04:00:50 AM
// Design Name: 
// Module Name: mux_All
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


module mux_All(A_plus_B, A_sub_borrow_B, A_move, A_sub_B, A_increment, A_decrement, Add_increment, A_AND_B, A_OR_B, A_EOR_B, comp_A, shift_left, opsel, mode, out);
    input A_plus_B, A_sub_borrow_B, A_move, A_sub_B, A_increment, A_decrement, Add_increment, A_AND_B, A_OR_B, A_EOR_B, comp_A, shift_left, mode;
    input [2:0] opsel;
    output out;

    reg temp;
    
    always @ (mode or opsel)
    begin
        case({mode, opsel})
            4'b0000:
                temp = A_plus_B;
            4'b0001:
                temp = A_sub_borrow_B;
            4'b0010:
                temp = A_move;
            4'b0011:
                temp = A_sub_B;
            4'b0100:
                temp = A_increment;
            4'b0101:
                temp = A_decrement;
            4'b0110:
                temp = Add_increment;
            4'b1000:
                temp = A_AND_B;
            4'b1001:
                temp = A_OR_B;
            4'b1010:
                temp = A_EOR_B;
            4'b1011:
                temp = comp_A;
            4'b1101:
                temp = shift_left;
            default:
                temp = 1'b0;
       endcase
             
    end
    assign out = temp;
endmodule
