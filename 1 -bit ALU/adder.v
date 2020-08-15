`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2019 02:12:31 PM
// Design Name: 
// Module Name: adder
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


module adder(A, B, cin, out, cout);
     input A, B, cin;
     output out, cout;
     

    assign out = A ^ B ^ cin;
    assign cout = ((A ^ B) & cin) | (A & B);
    
endmodule
