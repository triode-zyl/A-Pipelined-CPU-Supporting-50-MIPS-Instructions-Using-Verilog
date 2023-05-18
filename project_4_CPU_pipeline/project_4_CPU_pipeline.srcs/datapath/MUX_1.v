`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 20:00:35
// Design Name: 
// Module Name: MUX_1
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


module MUX_1(
    x0,x1,regdst,y
    );
    input [4:0] x0,x1;
    input regdst;
    output [4:0] y;
    
    function [4:0] select;
        input [4:0] x0,x1;
        input regdst;
        case(regdst)
            0:select=x0;
            1:select=x1;
        endcase
    endfunction
    assign y=select(x0,x1,regdst);
endmodule
