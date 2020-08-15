`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 01:30:03 PM
// Design Name: 
// Module Name: add_increment
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


module add_increment(A, B, out, cout);
    input A, B;
    output out, cout;
     

    assign out = A ^ B ^ (1'b1);
    assign cout = ((A ^ B) & (1'b1)) | (A & B);
endmodule
