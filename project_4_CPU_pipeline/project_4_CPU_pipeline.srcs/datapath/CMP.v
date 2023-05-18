`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 21:42:28
// Design Name: 
// Module Name: CMP
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


module CMP(
    aluoperation,branch_in,rsdata,rtdata,Branch
    );
    input [5:0] aluoperation;
    input branch_in;
    input [31:0] rsdata,rtdata;
    output Branch;
    function opt;
        input [5:0] aluoperation;
        input branch_in;
        input [31:0] rsdata,rtdata;
        case(aluoperation)
        6'b100001:opt=(branch_in&&rsdata==rtdata)?1:0;
        6'b100100:opt=(branch_in&&(rsdata[31]==1||rsdata==0))?1:0;
        6'b100110:opt=(branch_in&&(rsdata[31]==0&&rsdata!=0))?1:0;
        6'b100101:opt=(branch_in&&(rsdata[31]==1))?1:0;
        6'b101010:opt=(branch_in&&(rsdata[31]==0))?1:0;
        6'b101011:opt=(branch_in&&rsdata!=rtdata)?1:0;
        default:opt=0;
        endcase
    endfunction
    assign Branch=opt(aluoperation,branch_in,rsdata,rtdata);
endmodule
