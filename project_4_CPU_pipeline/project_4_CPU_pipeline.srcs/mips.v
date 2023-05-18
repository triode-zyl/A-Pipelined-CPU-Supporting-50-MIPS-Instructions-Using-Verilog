`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 18:31:34
// Design Name: 
// Module Name: mips
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


module mips(
    clk,reset
    );
    input clk;
    input reset;

    //IF part
    wire [31:0] new_PC,PC,NextPC_if,JumpAddr,BranchAddr,Instruction_if;   
    wire PC_IFWrite,Branch_Z;
    
    //IF/ID register part
    wire en_if_id;  
    
    //ID part
    wire [31:0] Instruction_id,NextPC_id;   
    wire [4:0] RsAddr_id,RtAddr_id,RdAddr_id,Shamt_id;
    wire [5:0] Op_id,Func_id;
    wire [15:0] Imm16;
    wire MemToReg_id,RegWrite_id,MemWrite_id,MemRead_id,ALUSrcA_id,ALUSrcB_id,RegDst_id,Jal_id,Lui_id,Jr_id,Jump_id,ZExt_id,Branch_id,Jalr_id,MADSrc_id;
    wire [5:0] ALUoperation_id;
    wire [31:0] PC_8_id,LuiData_id,SExt_32_id,ZExt_32_id,Ext_32_id,RsData_id,RtData_id;
    wire [1:0] ForwardA_id,ForwardB_id;
    wire [31:0] MUX3_3Result_id,MUX3_4Result_id;
    wire [31:0] MUX_3Result_id;
    wire [1:0] Store_id;
    wire [2:0] Load_id;
    
    //ED/EX register part
    wire clr_id_ex; 

    //EX part
    wire MemToReg_ex,RegWrite_ex,MemWrite_ex,MemRead_ex,ALUSrcA_ex,ALUSrcB_ex,RegDst_ex,Jal_ex,Lui_ex,Jalr_ex,MADSrc_ex;  
    wire [5:0] ALUoperation_ex;
    wire [31:0] PC_8_ex,LuiData_ex,Ext_32_ex,ZExt_32_ex,RsData_ex,RtData_ex,MemWriteData_ex,MUX3_1Result_ex,ALUA_ex,ALUB_ex,ALUResult_ex,MADResult_ex,FinalResult_ex;
    wire [4:0] RdAddr_ex,RsAddr_ex,RtAddr_ex,Rd_RtAddr,RegWriteAddr_ex,Shamt_ex;
    wire [1:0] ForwardA_ex,ForwardB_ex;
    wire [1:0] Store_ex;
    wire [2:0] Load_ex;
    wire [3:0] MADSignal_ex;

    //MEM part
    wire MemToReg_mem,RegWrite_mem,MemRead_mem,MemWrite_mem,Jal_mem,Lui_mem;    
    wire [31:0] PC_8_mem,LuiData_mem,ALUResult_mem,MemWriteData_mem,MemReadData_mem;
    wire [4:0] RegWriteAddr_mem;
    wire [1:0] Store_mem;
    wire [2:0] Load_mem;

    //WB part
    wire RegWrite_wb,MemToReg_wb,Jal_wb,Lui_wb; 
    wire [31:0] PC_8_wb,MemReadData_wb,MemReadDataFinal_wb,ALUResult_wb,LuiData_wb,MUX_4Result_wb,MUX_7Result_wb,RegWriteData_wb;
    wire [4:0] RegWriteAddr_wb; 
    wire [2:0] Load_wb;
    
/*    wire regdst,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump,jr,jal,lui,z_ext,beq;   //CUï¿½ï¿½ï¿???
    wire [2:0] aluop;
    wire [5:0] op,func;
    wire [4:0] rs,rt,rd,regdst_Y,w_reg;
    wire [15:0] imm16;
    wire [25:0] addr_26;
    wire [31:0] w_data,r_data1,r_data2;   //registersï¿½ï¿½ï¿???
    wire [31:0] shl16_imm16,sext_imm16,zext_imm16,z_ext_Y;    //ï¿½Ð¼ï¿½ï¿½ï¿½ï¿???
    wire [31:0] alu_B,aluresult;
    wire [3:0] aluoperation;
    wire zero;
    wire [31:0] r_data,memtoreg_Y,jal_Y;    //dmï¿½ï¿½ï¿???
    wire and_Y;
    wire [1:0] out3_2;*/

    //IF part
    pc pc(clk,reset,PC,new_PC,PC_IFWrite);
//    Hazard Hazard(RsAddr_id,RtAddr_id,RtAddr_ex,MemRead_ex,RegWriteAddr_ex,PC_IFWrite,en_if_id,clr_id_ex,Jal_mem,Jr_id);
    im_8k im_8k(PC[12:2],Instruction_if);
    Add_1 add_1(4,PC,NextPC_if);
    combine_PCaddress Comb_PCAddr(Instruction_id[25:0],NextPC_id,JumpAddr);
    MUX MUX(NextPC_if,BranchAddr,JumpAddr,RsData_id,new_PC,Jr_id,Jump_id,Branch_Z);
    CMP CMP(ALUoperation_id,Branch_id,MUX3_3Result_id,MUX3_4Result_id,Branch_Z);
    
    //IF/ID register part
    IF_ID_REG IF_ID_REGISTERS(en_if_id,clk,NextPC_if,Instruction_if,NextPC_id,Instruction_id);

    //ID part
    assign Op_id=Instruction_id[31:26];
//    wire [4:0] aaa;
//    assign aaa=Instruction_id[25:21];
    assign RsAddr_id=Instruction_id[25:21];
    assign RtAddr_id=Instruction_id[20:16];
    assign RdAddr_id=Instruction_id[15:11];
    assign Shamt_id=Instruction_id[10:6];
    assign Func_id=Instruction_id[5:0];
    assign Imm16=Instruction_id[15:0];
    ctrl ctrl(Op_id,Func_id,RtAddr_id,RegDst_id,ALUSrcA_id,ALUSrcB_id,MemToReg_id,RegWrite_id,MemRead_id,MemWrite_id,ALUoperation_id,Jump_id,Jr_id,Jal_id,Lui_id,ZExt_id,Branch_id,Jalr_id,Store_id,Load_id,MADSrc_id);
    Combine_BranchAddr Comb_BranchAddr(NextPC_id,SExt_32_id,BranchAddr);
    sign_extend sext(Imm16,SExt_32_id);
    zero_extend zext(Imm16,ZExt_32_id);
    SHL16 shl16(Imm16,LuiData_id);
    MUX_5 mux_5(SExt_32_id,ZExt_32_id,ZExt_id,Ext_32_id);
    Add_3 add_3(NextPC_id,4,PC_8_id);
    Hazard Hazard(RsAddr_id,RtAddr_id,MemRead_ex,RegWriteAddr_ex,PC_IFWrite,en_if_id,clr_id_ex,Jal_mem,Jr_id,RegWrite_ex,Branch_id,MemRead_mem,RegWrite_mem,RegWriteAddr_mem,MADSignal_ex);
    registers registers(RsAddr_id,RtAddr_id,RegWriteAddr_wb,RegWriteData_wb,RsData_id,RtData_id,RegWrite_wb,clk);
    MUX_3 MUX_3(RtData_id,LuiData_id,Lui_id,MUX_3Result_id);
    Forwarding_id Forwarding_id(RsAddr_id,RtAddr_id,RegWrite_mem,RegWriteAddr_mem,RegWrite_ex,RegWriteAddr_ex,ForwardA_id,ForwardB_id);
    MUX3_3 MUX3_3(RsData_id,ALUResult_mem,ALUResult_ex,ForwardA_id,MUX3_3Result_id);
    MUX3_4 MUX3_4(MUX_3Result_id,ALUResult_mem,ALUResult_ex,ForwardB_id,MUX3_4Result_id);
    
    //ID/EX register part
    ID_EX_REG ID_EX_REGISTERS(
    clk, clr_id_ex, 
    MemToReg_id, RegWrite_id, MemWrite_id, MemRead_id, ALUoperation_id, ALUSrcA_id, ALUSrcB_id, RegDst_id, Jal_id, PC_8_id, Ext_32_id, Shamt_id, RdAddr_id, RsAddr_id, RtAddr_id, RsData_id, MUX_3Result_id, Lui_id,Jalr_id,Store_id,Load_id,MADSrc_id, 
    MemToReg_ex, RegWrite_ex, MemWrite_ex, MemRead_ex, ALUoperation_ex, ALUSrcA_ex, ALUSrcB_ex, RegDst_ex, Jal_ex, PC_8_ex, Ext_32_ex, Shamt_ex, RdAddr_ex, RsAddr_ex, RtAddr_ex, RsData_ex, RtData_ex, Lui_ex,Jalr_ex,Store_ex,Load_ex,MADSrc_ex
    );

    //EX part
    MUX3_1 MUX3_1(RsData_ex,RegWriteData_wb,ALUResult_mem,ForwardA_ex,MUX3_1Result_ex);
    MUX3_2 MUX3_2(RtData_ex,RegWriteData_wb,ALUResult_mem,ForwardB_ex,MemWriteData_ex);
    MUX_1 MUX_1(RtAddr_ex,RdAddr_ex,RegDst_ex,Rd_RtAddr);
    MUX_2 MUX_2(Rd_RtAddr,5'b11111,Jal_ex,Jalr_ex,RegWriteAddr_ex);
    MUX_6 MUX_6(MemWriteData_ex,Ext_32_ex,ALUSrcB_ex,ALUB_ex);
    MUX_8 MUX_8(MUX3_1Result_ex,Shamt_ex,ALUSrcA_ex,ALUA_ex);
    alu alu(ALUA_ex,ALUB_ex,ALUoperation_ex,ALUResult_ex);
    Forwarding_ex Forwarding_ex(RsAddr_ex,RtAddr_ex,RegWrite_wb,RegWriteAddr_wb,RegWrite_mem,RegWriteAddr_mem,ForwardA_ex,ForwardB_ex,Lui_ex);
    MAD MAD(ALUA_ex,ALUB_ex,ALUoperation_ex,MADSignal_ex,MADResult_ex,clk);
    MUX_9 MUX_9(ALUResult_ex,MADResult_ex,MADSrc_ex,FinalResult_ex);
    
    //EX/MEM register part
    EX_MEM_REG EX_MEM_REGISTERS(
    clk, 
    MemToReg_ex, RegWrite_ex, MemRead_ex, MemWrite_ex, Jal_ex, PC_8_ex, FinalResult_ex, MemWriteData_ex, RegWriteAddr_ex,Store_ex,Load_ex, 
    MemToReg_mem, RegWrite_mem, MemRead_mem, MemWrite_mem, Jal_mem, PC_8_mem, ALUResult_mem, MemWriteData_mem, RegWriteAddr_mem,Store_mem,Load_mem
    );

    //MEM part
    dm_8k dm_8k(ALUResult_mem[12:0],Store_mem,MemWriteData_mem,MemWrite_mem,clk,MemReadData_mem);
    
    //MEM/WB register part
    MEM_WB_REG MEM_WB_REGISTERS(
    clk, 
    RegWrite_mem, MemToReg_mem, Jal_mem, PC_8_mem, MemReadData_mem, ALUResult_mem, RegWriteAddr_mem, Load_mem, 
    RegWrite_wb, MemToReg_wb, Jal_wb, PC_8_wb, MemReadData_wb, ALUResult_wb, RegWriteAddr_wb, Load_wb
    );
    
    //WB part
    DMExtend DMExtend(MemReadData_wb,Load_wb,MemReadDataFinal_wb);
    MUX_7 MUX_7(ALUResult_wb,MemReadDataFinal_wb,MemToReg_wb,MUX_7Result_wb);
    MUX_4 MUX_4(MUX_7Result_wb,PC_8_wb,Jal_wb,RegWriteData_wb);
//    MUX_3 MUX_3(MUX4Result_wb,LuiData_wb,Lui_wb,RegWriteData_wb);

/*    //assign addr_26=instruction[25:0];
    assign Op_id=Instruction_id[31:26];
    assign rs=instruction[25:21];
    assign rt=instruction[20:16];
    assign rd=instruction[15:11];
    assign func=instruction[5:0];
    assign imm16=instruction[15:0];
    MUX_1 mux_1(rt,rd,regdst,regdst_Y);
    MUX_2 mux_2(regdst_Y,31,jal,w_reg);
    MUX_3 mux_3(jal_Y,shl16_imm16,lui,w_data);
    registers registers(rs,rt,w_reg,w_data,r_data1,r_data2,regwrite,clk);
    MUX_5 mux_5(sext_imm16,zext_imm16,z_ext,z_ext_Y);
    MUX_6 mux_6(r_data2,z_ext_Y,alusrc,alu_B);
    alu alu(r_data1,alu_B,aluoperation,aluresult,zero);
    dm_8k dm_8k(aluresult[11:2],r_data2,memread,memwrite,clk,r_data);
    MUX_7 mux_7(aluresult,r_data,memtoreg,memtoreg_Y);
    MUX_4 mux_4(memtoreg_Y,pc_4,jal,jal_Y);
    SHL16 shl16(imm16,shl16_imm16);
    sign_extend sext(imm16,sext_imm16);
    zero_extend zext(imm16,zext_imm16);
    ALU_Control alu_c(aluop,func,aluoperation);
    ctrl ctrl(op,func,regdst,alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop,jump,jr,jal,lui,z_ext);
    
    SHL2_2 shl2(z_ext_Y,branch_addr);
    Add_2 add_2(pc_4,branch_addr,beq_addr);
    //Add_3 add_3(pc_4,4,pc_8);
    combine_PCaddress cmb_addr(addr_26,pc_4,jump_addr);
    And And(branch,zero,beq);
    coding3_2 coding3_2(jr,jump,beq,out3_2);*/
endmodule
