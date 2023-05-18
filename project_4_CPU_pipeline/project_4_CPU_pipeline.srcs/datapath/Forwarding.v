`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 21:42:28
// Design Name: 
// Module Name: Forwarding
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


module Forwarding_ex(
    RsAddr_ex,RtAddr_ex,RegWrite_wb,RegWriteAddr_wb,RegWrite_mem,RegWriteAddr_mem,ForwardA,ForwardB,Lui_ex
    );
    input [4:0] RsAddr_ex,RtAddr_ex,RegWriteAddr_wb,RegWriteAddr_mem;
    input RegWrite_wb,RegWrite_mem,Lui_ex;
    output [1:0] ForwardA,ForwardB;
    function [1:0] A;
        input [4:0] RsAddr_ex,RtAddr_ex,RegWriteAddr_wb,RegWriteAddr_mem;
        input RegWrite_wb,RegWrite_mem;
        if(!Lui_ex&&RegWrite_mem&&(RegWriteAddr_mem!=0)&&(RegWriteAddr_mem==RsAddr_ex))
        begin
            A=2'b10;
        end
        else if(!Lui_ex&&RegWrite_wb&&(RegWriteAddr_wb!=0)
        && (!(RegWrite_mem&&(RegWriteAddr_mem!=0)&&(RegWriteAddr_mem==RsAddr_ex)))
        &&(RegWriteAddr_wb==RsAddr_ex))
        begin
            A=2'b01;
        end
        else
        begin
            A=2'b00;
        end
    endfunction
        function [1:0] B;
        input [4:0] RsAddr_ex,RtAddr_ex,RegWriteAddr_wb,RegWriteAddr_mem;
        input RegWrite_wb,RegWrite_mem;
        if(!Lui_ex&&RegWrite_mem&&(RegWriteAddr_mem!=0)&&(RegWriteAddr_mem==RtAddr_ex))
        begin
            B=2'b10;
        end
        else if(!Lui_ex&&RegWrite_wb&&(RegWriteAddr_wb!=0)
        && (!(RegWrite_mem&&(RegWriteAddr_mem!=0)&&(RegWriteAddr_mem==RtAddr_ex)))
        &&(RegWriteAddr_wb==RtAddr_ex))
        begin
            B=2'b01;
        end
        else
        begin
            B=2'b00;
        end
    endfunction
    assign ForwardA=A(RsAddr_ex,RtAddr_ex,RegWriteAddr_wb,RegWriteAddr_mem,RegWrite_wb,RegWrite_mem);
    assign ForwardB=B(RsAddr_ex,RtAddr_ex,RegWriteAddr_wb,RegWriteAddr_mem,RegWrite_wb,RegWrite_mem);
endmodule
