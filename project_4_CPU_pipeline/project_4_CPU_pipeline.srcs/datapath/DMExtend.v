`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/14 23:29:52
// Design Name: 
// Module Name: DMExtend
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


module DMExtend(
    MemReadData_wb,Load_wb,MemReadDataFinal_wb
    );
    input [31:0] MemReadData_wb;
    input [2:0] Load_wb;
    output [31:0] MemReadDataFinal_wb;
    function [31:0] extend;
        input [31:0] MemReadData_wb;
        input [2:0] Load_wb;
        case(Load_wb)
        3'b001:extend=MemReadData_wb[7:0];
        3'b101:extend=$signed(MemReadData_wb<<24)>>>24;
        3'b011:extend=MemReadData_wb[15:0];
        3'b111:extend=$signed(MemReadData_wb<<16)>>>16;
        default:extend=MemReadData_wb;
        endcase
    endfunction
    assign MemReadDataFinal_wb=extend(MemReadData_wb,Load_wb);
endmodule
