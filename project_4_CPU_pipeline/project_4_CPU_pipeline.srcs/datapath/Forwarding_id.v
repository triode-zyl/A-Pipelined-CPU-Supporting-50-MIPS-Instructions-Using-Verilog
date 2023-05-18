`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/12 10:45:14
// Design Name: 
// Module Name: Forwarding_id
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


module Forwarding_id(
    RsAddr_id,RtAddr_id,RegWrite_mem,RegWriteAddr_mem,RegWrite_ex,RegWriteAddr_ex,ForwardA,ForwardB
    );
    input [4:0] RsAddr_id,RtAddr_id,RegWriteAddr_mem,RegWriteAddr_ex;
    input RegWrite_mem,RegWrite_ex;
    output [1:0] ForwardA,ForwardB;
    function [1:0] A;
        input [4:0] RsAddr_id,RtAddr_id,RegWriteAddr_mem,RegWriteAddr_ex;
        input RegWrite_mem,RegWrite_ex;
        if(RegWrite_ex&&(RegWriteAddr_ex!=0)&&(RegWriteAddr_ex==RsAddr_id))
        begin
            A=2'b10;
        end
        else if(RegWrite_mem&&(RegWriteAddr_mem!=0)
        && (!(RegWrite_ex&&(RegWriteAddr_ex!=0)&&(RegWriteAddr_ex==RsAddr_id)))
        &&(RegWriteAddr_mem==RsAddr_id))
        begin
            A=2'b01;
        end
        else
        begin
            A=2'b00;
        end
    endfunction
        function [1:0] B;
        input [4:0] RsAddr_id,RtAddr_id,RegWriteAddr_mem,RegWriteAddr_ex;
        input RegWrite_mem,RegWrite_ex;
        if(RegWrite_ex&&(RegWriteAddr_ex!=0)&&(RegWriteAddr_ex==RtAddr_id))
        begin
            B=2'b10;
        end
        else if(RegWrite_mem&&(RegWriteAddr_mem!=0)
        && (!(RegWrite_ex&&(RegWriteAddr_ex!=0)&&(RegWriteAddr_ex==RtAddr_id)))
        &&(RegWriteAddr_mem==RtAddr_id))
        begin
            B=2'b01;
        end
        else
        begin
            B=2'b00;
        end
    endfunction
    assign ForwardA=A(RsAddr_id,RtAddr_id,RegWriteAddr_mem,RegWriteAddr_ex,RegWrite_mem,RegWrite_ex);
    assign ForwardB=B(RsAddr_id,RtAddr_id,RegWriteAddr_mem,RegWriteAddr_ex,RegWrite_mem,RegWrite_ex);
endmodule
