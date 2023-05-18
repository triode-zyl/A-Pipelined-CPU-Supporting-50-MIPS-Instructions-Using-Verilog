`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 20:00:35
// Design Name: 
// Module Name: MUX_3
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


module MUX_3(
    x0,x1,lui,y
    );
    input [31:0] x0,x1;
    input lui;
    output [31:0] y;
    
    function [31:0] select;
        input [31:0] x0,x1;
        input lui;
        case(lui)
            0:select=x0;
            1:select=x1;
        endcase
    endfunction
    assign y=select(x0,x1,lui);
endmodule
