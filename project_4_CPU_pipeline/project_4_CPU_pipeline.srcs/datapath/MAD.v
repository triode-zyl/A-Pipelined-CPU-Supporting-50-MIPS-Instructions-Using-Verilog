`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 16:18:36
// Design Name: 
// Module Name: MAD
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


module MAD(
    A,B,op,signal,dout,clk
    );
    input clk;
    input [31:0] A,B;
    input [5:0] op;
    output [3:0] signal;
    output reg [31:0] dout;
    reg [63:0] result;
    reg [4:0] busy;
    initial
    begin
        result=0;
        busy=0;
    end
    always@(negedge clk)
    begin
//    function [63:0] mult_and_div;
//        input [5:0] op;
        case(op)
        6'b011000:
        begin
            result=$signed(A)*$signed(B);
            busy=5;
        end
        6'b011001:
        begin
            result=A*B;
            busy=5;
        end
        6'b011010:
        begin
            result[31:0]=$signed(A)/$signed(B);
            result[63:32]=$signed(A)%$signed(B);
            //result[63:32]=A%B;
            busy=10;
        end
        6'b011011:
        begin
            result[31:0]=A/B;
            result[63:32]=A%B;
            busy=10;
        end
        6'b010000:dout=result[63:32];
        6'b010010:dout=result[31:0];

        6'b010001:result[63:32]=A;
        6'b010011:result[31:0]=A;
        endcase
        if(busy>0) busy=busy-1;
    end
    assign signal=busy;
endmodule
