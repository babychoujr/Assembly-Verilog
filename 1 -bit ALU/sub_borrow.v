`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 01:21:06 PM
// Design Name: 
// Module Name: sub_borrow
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


module sub_borrow(A, B, out, cout);
    input A, B;
    output out, cout;
    
    assign out = A ^ B ^ (1'b0);
    assign cout = (~(A ^ B) & (1'b0)) | (~A & B);
endmodule
