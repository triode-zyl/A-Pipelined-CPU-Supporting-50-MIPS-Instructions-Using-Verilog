`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 21:20:49
// Design Name: 
// Module Name: IF_ID_REG
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


module IF_ID_REG(
    en,clk,
    NPC_if,instruction_if,
    NPC_id,instruction_id
    );
    input en,clk;
    input [31:0] NPC_if,instruction_if;
    output reg [31:0] NPC_id,instruction_id;
    
    initial
    begin
        NPC_id = 0;
        instruction_id = 0;
    end
    
    always@(posedge clk)
    begin
        if(en == 0)
        begin
            NPC_id = NPC_if;
            instruction_id = instruction_if;
        end
    end
endmodule
