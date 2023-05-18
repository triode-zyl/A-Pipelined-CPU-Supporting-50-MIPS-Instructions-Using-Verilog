`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 18:31:34
// Design Name: 
// Module Name: dm
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


module dm_8k(
    addr, store, din, memwrite, clk, dout
    );
    input [12:0] addr;
    input [1:0] store;
    input [31:0] din;
    input memwrite;
    input clk;
    output [31:0] dout;
    //reg [31:0] out;
    reg [31:0] dm [2047:0];
    
//    wire [10:0] tmp;
//    assign tmp = {~addr[12],addr[11:2]};    
    
    integer i;
    initial begin
        for(i=0;i<2048;i=i+1)
            dm[i]=32'b0;
    end
    
    assign dout=dm[addr[12:2]]>>(addr[1:0]*8);     
/*    always@(*) begin
        if(memread)
            out=dm[tmp];
    end*/
    
    always@(negedge clk) begin
        if(memwrite)
        begin
            case(store)
            2'b1:
                case(addr[1:0])
                2'b0:dm[addr[12:2]][7:0]=din[7:0];
                2'b1:dm[addr[12:2]][15:8]=din[7:0];
                2'b10:dm[addr[12:2]][23:16]=din[7:0];
                2'b11:dm[addr[12:2]][31:24]=din[7:0];
                endcase
            2'b10:
                case(addr[1:0])
                2'b0:dm[addr[12:2]][15:0]=din[15:0];
                2'b1:dm[addr[12:2]][23:8]=din[15:0];
                2'b10:dm[addr[12:2]][31:16]=din[15:0];
                endcase
            default:dm[addr[12:2]]=din;
            endcase
        end
    end
endmodule
