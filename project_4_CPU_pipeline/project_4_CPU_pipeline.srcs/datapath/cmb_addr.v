`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 19:17:03
// Design Name: 
// Module Name: combine_address
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


module combine_PCaddress(
    addr,pc,jumpaddr
    );
    input [25:0] addr;
    input [31:0] pc;
    output [31:0] jumpaddr;
    assign jumpaddr={pc[31:28],addr[25:0],2'b00};
endmodule
