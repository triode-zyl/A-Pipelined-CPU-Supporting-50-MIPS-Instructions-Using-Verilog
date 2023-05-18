`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 18:31:34
// Design Name: 
// Module Name: ctrl
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


module ctrl(
    op,func,rt,regdst,alusrcA,alusrcB,memtoreg,regwrite,memread,memwrite,aluoperation,jump,jr,jal,lui,z_ext,branch,jalr,store,load,MADSrc
    );
    input [5:0] op,func;
    input [4:0] rt;
    output regdst,alusrcA,alusrcB,memtoreg,regwrite,memread,memwrite,jump,jr,jal,lui,z_ext,branch,jalr,MADSrc;
    output [1:0] store;
    output [2:0] load;
    output [5:0] aluoperation;
    wire [2:0] aluop;
    wire R,ori,lui,lw,lb,lbu,lh,lhu,sw,sb,sh,addi,addiu,andi,xori,beq,blez,bgtz,bltz,bgez,bne,slti,sltiu,j,nop_tmp,nop,jr_tmp,jal_tmp;
    wire mult,multu,div,divu,mthi,mtlo,mfhi,mflo;
    assign R=!op[0]&!op[1]&!op[2]&!op[3]&!op[4]&!op[5];
    assign lw=op[0]&op[1]&!op[2]&!op[3]&!op[4]&op[5];
    assign sw=op[0]&op[1]&!op[2]&op[3]&!op[4]&op[5];
    assign beq=!op[0]&!op[1]&op[2]&!op[3]&!op[4]&!op[5];
    assign jr_tmp=R&!func[5]&!func[4]&func[3]&!func[2]&!func[1]&!func[0];
    assign jal_tmp=op[0]&op[1]&!op[2]&!op[3]&!op[4]&!op[5];
    assign lui=op[0]&op[1]&op[2]&op[3]&!op[4]&!op[5];
    assign ori=op[0]&!op[1]&op[2]&op[3]&!op[4]&!op[5];
    assign j=!op[0]&op[1]&!op[2]&!op[3]&!op[4]&!op[5];
    assign nop_tmp=R&!func[5]&!func[4]&!func[3]&!func[2]&!func[1]&!func[0];

    assign lb=!op[0]&!op[1]&!op[2]&!op[3]&!op[4]&op[5];
    assign lbu=!op[0]&!op[1]&op[2]&!op[3]&!op[4]&op[5];
    assign lh=op[0]&!op[1]&!op[2]&!op[3]&!op[4]&op[5];
    assign lhu=op[0]&!op[1]&op[2]&!op[3]&!op[4]&op[5];
    assign sb=!op[0]&!op[1]&!op[2]&op[3]&!op[4]&op[5];
    assign sh=op[0]&!op[1]&!op[2]&op[3]&!op[4]&op[5];
    assign addi=!op[0]&!op[1]&!op[2]&op[3]&!op[4]&!op[5];
    assign addiu=op[0]&!op[1]&!op[2]&op[3]&!op[4]&!op[5];
    assign andi=!op[0]&!op[1]&op[2]&op[3]&!op[4]&!op[5];
    assign xori=!op[0]&op[1]&op[2]&op[3]&!op[4]&!op[5];
    assign blez=!op[0]&op[1]&op[2]&!op[3]&!op[4]&!op[5];
    assign bgtz=op[0]&op[1]&op[2]&!op[3]&!op[4]&!op[5];
    assign bltz=op[0]&!op[1]&!op[2]&!op[3]&!op[4]&!op[5]&!rt[0];
    assign bgez=op[0]&!op[1]&!op[2]&!op[3]&!op[4]&!op[5]&rt[0];
    assign bne=op[0]&!op[1]&op[2]&!op[3]&!op[4]&!op[5];
    assign slti=!op[0]&op[1]&!op[2]&op[3]&!op[4]&!op[5];
    assign sltiu=op[0]&op[1]&!op[2]&op[3]&!op[4]&!op[5];
    assign jalr=R&!func[5]&!func[4]&func[3]&!func[2]&!func[1]&func[0];
    
    wire sll,sll_tmp,srl,sra;
    assign sll=R&!func[5]&!func[4]&!func[3]&!func[2]&!func[1]&!func[0];
    assign srl=R&!func[5]&!func[4]&!func[3]&!func[2]&func[1]&!func[0];
    assign sra=R&!func[5]&!func[4]&!func[3]&!func[2]&func[1]&func[0];
    
    assign mult=R&!func[5]&func[4]&func[3]&!func[2]&!func[1]&!func[0];
    assign multu=R&!func[5]&func[4]&func[3]&!func[2]&!func[1]&func[0];
    assign div=R&!func[5]&func[4]&func[3]&!func[2]&func[1]&!func[0];
    assign divu=R&!func[5]&func[4]&func[3]&!func[2]&func[1]&func[0];
    assign mthi=R&!func[5]&func[4]&!func[3]&!func[2]&!func[1]&func[0];
    assign mtlo=R&!func[5]&func[4]&!func[3]&!func[2]&func[1]&func[0];
    assign mfhi=R&!func[5]&func[4]&!func[3]&!func[2]&!func[1]&!func[0];
    assign mflo=R&!func[5]&func[4]&!func[3]&!func[2]&func[1]&!func[0];
    
    assign nop=(rt==0)?nop_tmp:0;
    assign sll=(rt!=0)?sll_tmp:0; 
    
    assign jr=jr_tmp|jalr;
    assign jal=jal_tmp|jalr;
    assign jump=jal_tmp|j;
    assign memread=lw|lb|lbu|lh|lhu;
    assign regdst=R;
    assign alusrcA=sll|srl|sra;
    assign alusrcB=ori|lw|lb|lbu|lh|lhu|sw|sb|sh|addi|addiu|andi|xori|slti|sltiu;
    assign memtoreg=lw|lb|lbu|lh|lhu;
    assign regwrite=(R&!jr&!nop&!mult&!multu&!div&!divu&!mthi&!mtlo)|lui|ori|lw|lb|lbu|lh|lhu|addi|addiu|andi|xori|slti|sltiu|jal;
    assign memwrite=sw|sb|sh;
    assign aluop[2]=ori|bltz|bgez|bne|slti|sltiu;
    assign aluop[1]=R|xori|bgtz|bne|sltiu;
    assign aluop[0]=andi|xori|blez|bgtz|bgez|slti;
    assign z_ext=ori|andi|xori;
    assign branch=beq|blez|bgtz|bltz|bgez|bne;
    assign store[1]=sh;
    assign store[0]=sb;
    assign load[2]=lh|lb;
    assign load[1]=lh|lhu;
    assign load[0]=lb|lbu|lh|lhu;
    assign MADSrc=mfhi|                                                                                                   mflo;
    
    function [5:0] opt;
        input [2:0] aluop;
        input [5:0] func;
        case(aluop)
        3'b010:
            opt=func;
        3'b0:opt=6'b100001;
        3'b1:opt=6'b100100;
        3'b11:opt=6'b100110;
        3'b100:opt=6'b100101;
        3'b101:opt=6'b101010;
        3'b110:opt=6'b101011;
        
        endcase
    endfunction
    assign aluoperation=opt(aluop,func);
endmodule
