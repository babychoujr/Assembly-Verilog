`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 01:33:34 PM
// Design Name: 
// Module Name: decrement
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


module decrement(A, out, cout);
    input A;
    output out, cout;
    
    assign out = A ^ (1'b0) ^ (1'b1);
    assign cout = (~(A ^ (1'b0)) & (1'b1)) | (~A & (1'b0));
endmodule
