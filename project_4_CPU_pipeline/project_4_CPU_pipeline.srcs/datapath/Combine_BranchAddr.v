`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:11:35
// Design Name: 
// Module Name: Combine_BranchAddr
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


module Combine_BranchAddr(
    NextPC_id,SExt_32_id,BranchAddr
    );
    input [31:0] NextPC_id,SExt_32_id;
    output [31:0] BranchAddr;
    assign BranchAddr=NextPC_id+(SExt_32_id<<2);
endmodule
