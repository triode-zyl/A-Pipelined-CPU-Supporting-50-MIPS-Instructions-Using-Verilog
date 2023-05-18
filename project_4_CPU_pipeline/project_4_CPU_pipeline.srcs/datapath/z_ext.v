`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 19:04:06
// Design Name: 
// Module Name: zero_extend
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


module zero_extend(
    zext_16, zext_32
    );
    input [15:0] zext_16;
    output [31:0] zext_32;
    assign zext_32={16'b0,zext_16};
endmodule
