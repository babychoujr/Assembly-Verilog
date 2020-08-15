`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2019 02:04:52 PM
// Design Name: 
// Module Name: alu_1bit
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


module alu_1bit(
    input A,
    input B,
    input cin,
    input [2:0] opsel,
    input mode,
    output out,
    output cout
    );
    // 12 different output wires
    wire A_plus_B;
    wire A_sub_borrow_B;
    wire A_move;
    wire A_sub_B;
    wire A_increment;
    wire A_decrement;
    wire Add_increment;
    wire A_AND_B;
    wire A_OR_B;
    wire A_EOR_B;
    wire comp_A;
    wire shift_Left;
    
    //different couts
    wire adderCout;
    wire subBorrowCout;
    wire subCout;
    wire incrementCout;
    wire decrementCout;
    wire addIncrementCout;
    wire shiftCout;
    //12 different instianting modules
    adder inst_Add(A, B, cin, A_plus_B, adderCout);
    sub_borrow inst_Sub_Borrow(A, B, A_sub_borrow_B, subBorrowCout);
    move inst_Move(A, A_move);
    sub inst_Sub(A, B, A_sub_B, subCout);
    increment inst_Increment(A, A_increment, incrementCout);
    decrement inst_Decrement(A, A_decrement, decrementCout);
    add_increment inst_Add_Increment(A, B, Add_increment, addIncrementCout);
    bitAnd inst_AND(A, B, A_AND_B);
    bitOr  inst_OR(A, B, A_OR_B);
    bitEOr inst_EOR(A, B, A_EOR_B);
    compliment inst_compliment(A, comp_A);
    shiftLeft  inst_ShiftLeft(A, shift_left, shiftCout);
    
    cout_All inst_CoutAll(adderCout, subBorrowCout, subCout, incrementCout, decrementCout, addIncrementCout, shiftCout, opsel, mode, cout);
    mux_All inst_MuxAll(A_plus_B, A_sub_borrow_B, A_move, A_sub_B, A_increment, A_decrement, Add_increment, A_AND_B, A_OR_B, A_EOR_B, comp_A, shift_left, opsel, mode, out);
endmodule
