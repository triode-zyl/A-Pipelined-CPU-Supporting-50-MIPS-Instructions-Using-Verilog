`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 18:31:34
// Design Name: 
// Module Name: im
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


module im_8k(
    addr, dout
    );
    input [12:2] addr;
    output [31:0] dout;
    
    reg [31:0] im [2047:0];
    
    wire [10:0] tmp;
    assign tmp = {~addr[12],addr[11:2]};
    
    assign dout = im[tmp];
    
    
    initial
        $readmemh("C:/Users/12875/CPU_vivado/project_4_CPU_pipeline/project_4_CPU_pipeline.srcs/code.txt", im);
endmodule
