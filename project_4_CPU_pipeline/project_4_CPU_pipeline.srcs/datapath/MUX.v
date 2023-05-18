`timescale 1ns / 1ps
module MUX(
    NextPC,BranchAddr,JumpAddr,JrAddr,PC,Jr,J,Branch
    );
    input [31:0] NextPC,BranchAddr,JumpAddr,JrAddr;
    input Jr,J,Branch;
    output [31:0] PC;

    function [31:0] select;
        input [31:0] NextPC,BranchAddr,JumpAddr,JrAddr;
        input Jr,J,Branch;
        case({Jr,J,Branch})
            3'b100:select=JrAddr;
            3'b010:select=JumpAddr;
            3'b001:select=BranchAddr;
            default:select=NextPC;
        endcase
    endfunction
    assign PC=select(NextPC,BranchAddr,JumpAddr,JrAddr,Jr,J,Branch);
endmodule