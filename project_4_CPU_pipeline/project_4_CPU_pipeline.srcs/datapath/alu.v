`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 18:23:41
// Design Name: 
// Module Name: 
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


module alu(
    A,B,op,result//,zero
    );
    input [31:0] A,B;
    input [5:0] op;
    output [31:0] result;
    //output zero;
    reg [31:0] r;
    always@(*) begin
    case(op) 
    6'b100001:r=A+B;
    6'b100011:r=A-B;
    6'b100000:r=A+B;
    6'b100010:r=A-B;
    6'b100100:r=A&B;
    6'b100101:r=A|B;
    6'b100110:r=A^B;
    6'b100111:r=~(A|B);
    6'b101010:r=($signed(A)<$signed(B));
    6'b101011:r=(A<B);
    6'b000000:r=B<<A[4:0];
    6'b000010:r=B>>A[4:0];
    6'b000011:r=$signed(B)>>>A[4:0];
    6'b000100:r=B<<A[4:0];
    6'b000110:r=B>>A[4:0];
    6'b000111:r=$signed(B)>>>A[4:0];
    endcase
    end
    assign result=r;
    //assign zero=(result==32'b0)?1:0;
endmodule
