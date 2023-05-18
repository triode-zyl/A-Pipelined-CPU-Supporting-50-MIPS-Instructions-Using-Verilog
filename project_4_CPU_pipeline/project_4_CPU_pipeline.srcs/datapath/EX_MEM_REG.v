`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 21:20:49
// Design Name: 
// Module Name: EX_MEM_REG
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


module EX_MEM_REG(
    clk, 
    MemToReg_ex, RegWrite_ex, MemRead_ex, MemWrite_ex, jal_ex, PC_8_ex, ALU_Result_ex, MemWriteData_ex, RegWriteAddr_ex,Store_ex,Load_ex,
    MemToReg_mem, RegWrite_mem, MemRead_mem, MemWrite_mem, jal_mem, PC_8_mem, ALU_Result_mem, MemWriteData_mem, RegWriteAddr_mem,Store_mem,Load_mem
    );
    input clk;
    input MemToReg_ex, RegWrite_ex, MemRead_ex, MemWrite_ex, jal_ex;
    input [31:0] PC_8_ex, ALU_Result_ex, MemWriteData_ex;
    input [4:0] RegWriteAddr_ex;
    input [1:0] Store_ex;
    input [2:0] Load_ex;
    output reg MemToReg_mem, RegWrite_mem, MemRead_mem, MemWrite_mem, jal_mem;
    output reg [31:0] PC_8_mem, ALU_Result_mem, MemWriteData_mem;
    output reg [4:0] RegWriteAddr_mem;
    output reg [1:0] Store_mem;
    output reg [2:0] Load_mem;
    
    initial
    begin
        MemToReg_mem = 0;
        RegWrite_mem = 0;
        MemRead_mem = 0;
        MemWrite_mem = 0;
        jal_mem = 0;
        PC_8_mem = 0;
        ALU_Result_mem = 0;
        MemWriteData_mem = 0;
        RegWriteAddr_mem = 0;
        Store_mem=0;
        Load_mem=0;    
    end
    
    always@(posedge clk)
    begin
        MemToReg_mem = MemToReg_ex;
        RegWrite_mem = RegWrite_ex;
        MemRead_mem = MemRead_ex;
        MemWrite_mem = MemWrite_ex;
        jal_mem = jal_ex;
        PC_8_mem = PC_8_ex;
        ALU_Result_mem = ALU_Result_ex;
        MemWriteData_mem = MemWriteData_ex;
        RegWriteAddr_mem = RegWriteAddr_ex;
        Store_mem=Store_ex;
        Load_mem=Load_ex;
    end
endmodule
