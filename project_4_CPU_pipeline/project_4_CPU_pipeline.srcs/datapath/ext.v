`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 19:24:23
// Design Name: 
// Module Name: ext
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


module sign_extend(
    sig_16, sig_32
    );
    input [15:0] sig_16;
    output signed[31:0] sig_32;
    assign sig_32=$signed({sig_16[15:0],16'b0})>>>16;
    //assign sig_32=$signed(sig_32)>>>16;
endmodule
