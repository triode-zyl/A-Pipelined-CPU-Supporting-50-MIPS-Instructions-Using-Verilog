`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 21:20:49
// Design Name: 
// Module Name: ID_EX_REG
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


module ID_EX_REG(
    clk, clr, 
    MemToReg_id, RegWrite_id, MemWrite_id, MemRead_id, ALUoperation_id, ALUSrcA_id, ALUSrcB_id, RegDst_id, jal_id, PC_8_id, Ext_32_id, Shamt_id, Rd_id, Rs_id, Rt_id, RsData_id, RtData_id, lui_id,Jalr_id,Store_id,Load_id,MADSrc_id,
    MemToReg_ex, RegWrite_ex, MemWrite_ex, MemRead_ex, ALUoperation_ex, ALUSrcA_ex, ALUSrcB_ex, RegDst_ex, jal_ex, PC_8_ex, Ext_32_ex, Shamt_ex, Rd_ex, Rs_ex, Rt_ex, RsData_ex, RtData_ex, lui_ex,Jalr_ex,Store_ex,Load_ex,MADSrc_ex
    );
    input clk, clr;
    input MemToReg_id, RegWrite_id, MemWrite_id, MemRead_id, ALUSrcA_id, ALUSrcB_id, RegDst_id, jal_id, lui_id,Jalr_id,MADSrc_id;
    input [5:0] ALUoperation_id;
    input [31:0] PC_8_id, Ext_32_id, RsData_id, RtData_id;
    input [4:0] Rd_id, Rs_id, Rt_id, Shamt_id;
    input [1:0] Store_id;
    input [2:0] Load_id;
    output reg MemToReg_ex, RegWrite_ex, MemWrite_ex, MemRead_ex, ALUSrcA_ex, ALUSrcB_ex, RegDst_ex, jal_ex, lui_ex,Jalr_ex,MADSrc_ex;
    output reg [5:0] ALUoperation_ex;
    output reg [31:0] PC_8_ex, Ext_32_ex, RsData_ex, RtData_ex;
    output reg [4:0] Rd_ex, Rs_ex, Rt_ex, Shamt_ex;
    output reg [1:0] Store_ex;
    output reg [2:0] Load_ex;
    
    initial
    begin
        MemToReg_ex = 0;
        RegWrite_ex = 0;
        MemWrite_ex = 0;
        MemRead_ex = 0;
        ALUoperation_ex = 0;
        ALUSrcA_ex = 0;
        ALUSrcB_ex = 0;
        RegDst_ex = 0;
        jal_ex = 0;
        PC_8_ex = 0;
        Ext_32_ex = 0;
        Shamt_ex = 0;
        Rd_ex = 0;
        Rs_ex = 0;
        Rt_ex = 0;
        RsData_ex = 0;
        RtData_ex = 0;    
        lui_ex = 0;
        Jalr_ex = 0;
        Store_ex = 0;
        Load_ex = 0;
        MADSrc_ex = 0;
    end
    
    always@(posedge clk)
    begin
        if(clr == 1)
        begin
            MemToReg_ex = 0;
            RegWrite_ex = 0;
            MemWrite_ex = 0;
            MemRead_ex = 0;
            ALUoperation_ex = 0;
            ALUSrcA_ex = 0;
            ALUSrcB_ex = 0;
            RegDst_ex = 0;
            jal_ex = 0;
            lui_ex = 0;
            PC_8_ex = PC_8_id;
            Ext_32_ex = Ext_32_id;
            Shamt_ex = Shamt_id;
            Rd_ex = Rd_id;
            Rs_ex = Rs_id;
            Rt_ex = Rt_id;
            RsData_ex = RsData_id;
            RtData_ex = RtData_id;
            Jalr_ex = 0;
            Store_ex = Store_id;
            Load_ex = Load_id;
            MADSrc_ex = 0;
        end
        else
        begin
            MemToReg_ex = MemToReg_id;
            RegWrite_ex = RegWrite_id;
            MemWrite_ex = MemWrite_id;
            MemRead_ex = MemRead_id;
            ALUoperation_ex = ALUoperation_id;
            ALUSrcA_ex = ALUSrcA_id;
            ALUSrcB_ex = ALUSrcB_id;
            RegDst_ex = RegDst_id;
            jal_ex = jal_id;
            lui_ex = lui_id;
            PC_8_ex = PC_8_id;
            Ext_32_ex = Ext_32_id;
            Shamt_ex = Shamt_id;
            Rd_ex = Rd_id;
            Rs_ex = Rs_id;
            Rt_ex = Rt_id;
            RsData_ex = RsData_id;
            RtData_ex = RtData_id;
            Jalr_ex = Jalr_id;
            Store_ex = Store_id;
            Load_ex = Load_id;
            MADSrc_ex = MADSrc_id;
        end
    end
endmodule
