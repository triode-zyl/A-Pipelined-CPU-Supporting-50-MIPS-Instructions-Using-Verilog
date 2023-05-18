`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 20:38:35
// Design Name: 
// Module Name: registers
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


module registers(
    r_reg1,r_reg2,w_reg,w_data,r_data1,r_data2,regwrite,clk
    );
    input [4:0] r_reg1,r_reg2,w_reg;
    input [31:0] w_data;
    input regwrite,clk;
    output [31:0] r_data1,r_data2;
    reg [31:0] register [31:0];
    
    integer i;
    initial 
    begin
        for (i=0;i<32;i=i+1)
            register[i]<=32'b0;
    end
    assign r_data1=register[r_reg1];
    assign r_data2=register[r_reg2];
    always@(negedge clk) begin
        if(regwrite)
            register[w_reg]=w_data;
    end
endmodule
