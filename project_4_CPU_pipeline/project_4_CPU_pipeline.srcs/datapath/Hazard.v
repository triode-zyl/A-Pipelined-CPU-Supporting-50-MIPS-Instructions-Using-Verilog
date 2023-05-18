`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 21:42:28
// Design Name: 
// Module Name: Hazard
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


module Hazard(
    RsAddr_id,RtAddr_id,MemRead_ex,RegWriteAddr_ex,PC_IFWrite,en_if_id,clr_id_ex,Jal_mem,Jr_id,RegWrite_ex,Branch_id,MemRead_mem,RegWrite_mem,RegWriteAddr_mem,MADSignal_ex
    );
    input [4:0] RsAddr_id,RtAddr_id,RegWriteAddr_ex,RegWriteAddr_mem;
    input MemRead_ex,Jal_mem,Jr_id,RegWrite_ex,Branch_id,MemRead_mem,RegWrite_mem;
    input [3:0] MADSignal_ex;
    output PC_IFWrite,en_if_id,clr_id_ex;
    reg PC_IFWrite,en_if_id,clr_id_ex;
    initial
    begin
        en_if_id = 0;
        clr_id_ex = 0;
        PC_IFWrite = 0;
    end
    
    always@(*)
    begin
        if(MemRead_ex&&((RegWriteAddr_ex==RsAddr_id)||(RegWriteAddr_ex==RtAddr_id))
        ||(Jr_id&&Jal_mem)
        ||(Jr_id&&(RegWriteAddr_ex==RsAddr_id&&RegWrite_ex||RegWriteAddr_mem==RsAddr_id&&RegWrite_mem))
        ||(Branch_id&&((RegWriteAddr_ex==RsAddr_id||RegWriteAddr_ex==RtAddr_id)&&RegWrite_ex&&MemRead_ex || (RegWriteAddr_mem==RsAddr_id||RegWriteAddr_mem==RtAddr_id)&&RegWrite_mem&&(MemRead_mem||Jal_mem) ))
        ||MADSignal_ex>0)
        begin
            en_if_id = 1;
            clr_id_ex = 1;
            PC_IFWrite = 1;
        end
        else
        begin
            en_if_id = 0;
            clr_id_ex = 0;
            PC_IFWrite = 0;
        end
    end
endmodule
