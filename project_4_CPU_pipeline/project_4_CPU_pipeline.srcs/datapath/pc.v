`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 18:31:34
// Design Name: 
// Module Name: pc
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


module pc(
    clk,reset,pc,addr,en
    );
    input clk,reset,en;
    input [31:0] addr;
    output [31:0] pc;
    reg [31:0] pc;
    //initial 
    //begin 
    //    pc=0;
    //end
    always@(posedge clk or posedge reset) begin
        if(!en)
        begin
            pc=(reset)?32'h3000:addr;
        end
    end
endmodule
