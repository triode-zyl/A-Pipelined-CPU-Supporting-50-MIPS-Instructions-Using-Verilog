`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 21:09:08
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    aluop,func,aluoperation
    );
    input [2:0] aluop;
    input [5:0] func;
    output [3:0] aluoperation;
    function [3:0] opt;
        input [2:0] aluop;
        input [5:0] func;
        case(aluop)
        3'b010:
            case(func)
            6'b100001:opt=4'b10;
            6'b100011:opt=4'b110;
            endcase
        3'b0:opt=4'b10;
        3'b1:opt=4'b110;
        3'b100:opt=4'b1;
        endcase
    endfunction
    assign aluoperation=opt(aluop,func);
endmodule
