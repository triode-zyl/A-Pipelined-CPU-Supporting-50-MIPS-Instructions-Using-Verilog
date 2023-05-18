`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 20:00:35
// Design Name: 
// Module Name: MUX_2
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


module MUX_2(
    x0,x1,jal,jalr,y
    );
    input [4:0] x0,x1;
    input jal,jalr;
    output [4:0] y;
    
    function [4:0] select;
        input [4:0] x0,x1;
        input jal,jalr;
        case(jal)
            0:select=x0;
            1:select=x1;
        endcase
    endfunction
    //assign y=select(x0,x1,jal,jalr);
    assign y=(jal&&(!jalr))?x1:x0;
endmodule
