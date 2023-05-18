`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/12 10:54:10
// Design Name: 
// Module Name: MUX3_4
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


module MUX3_4(
    x0,x1,x2,signal,y
    );
    input [31:0] x0,x1,x2;
    input [1:0] signal;
    output [31:0] y;
    
    function [31:0] select;
        input [31:0] x0,x1,x2;
        input [1:0] signal;
        case(signal)
            0:select=x0;
            1:select=x1;
            2:select=x2;
        endcase
    endfunction
    assign y=select(x0,x1,x2,signal);
endmodule
