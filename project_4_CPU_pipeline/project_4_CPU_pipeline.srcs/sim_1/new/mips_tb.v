`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 21:28:12
// Design Name: 
// Module Name: mips_tb
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


module mips_tb(

    );
    //wire clk,reset;
    reg clk,reset;
    mips mips(clk,reset);
    initial begin
        clk = 0;
        reset = 1;
        #2
        clk = 1;
        reset = 1;
        #2;
        clk = 0;  // �½��أ�ʹPC������
        //reset = 1;  // ��������ź�
        #2;
        clk = 1;
        reset = 0;
        forever #2
        begin 
             clk = !clk;
             //$display("PC: %h",mips.PC);
        end
    end
endmodule
