`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 21:20:49
// Design Name: 
// Module Name: MEM_WB_REG
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


module MEM_WB_REG(
    clk, 
    RegWrite_mem, MemToReg_mem, jal_mem, PC_8_mem, DMData_mem, ALUResult_mem, RegWriteAddr_mem, Load_mem, 
    RegWrite_wb, MemToReg_wb, jal_wb, PC_8_wb, DMData_wb, ALUResult_wb, RegWriteAddr_wb, Load_wb
    );
    input clk;
    input RegWrite_mem, MemToReg_mem, jal_mem;
    input [31:0] PC_8_mem, DMData_mem, ALUResult_mem;
    input [4:0] RegWriteAddr_mem;
    input [2:0] Load_mem;
    output reg RegWrite_wb, MemToReg_wb, jal_wb;
    output reg [31:0] PC_8_wb, DMData_wb, ALUResult_wb;
    output reg [4:0] RegWriteAddr_wb;
    output reg [2:0] Load_wb;
    
    initial
    begin
        RegWrite_wb = 0;
        MemToReg_wb = 0;
        jal_wb = 0;
        PC_8_wb = 0;
        DMData_wb = 0;
        ALUResult_wb = 0;
        RegWriteAddr_wb = 0;   
        Load_wb = 0; 
    end
    
    always@(posedge clk)
    begin
        RegWrite_wb = RegWrite_mem;
        MemToReg_wb = MemToReg_mem;
        jal_wb = jal_mem;
        PC_8_wb = PC_8_mem;
        DMData_wb = DMData_mem;
        ALUResult_wb = ALUResult_mem;
        RegWriteAddr_wb = RegWriteAddr_mem;    
        Load_wb = Load_mem;
    end
endmodule
