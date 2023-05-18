`timescale 1ns / 1ps
module coding3_2(
    jr,jump,beq,out
    );
    input jr,jump,beq;
    output [1:0]out;
    function [1:0] select;
        input jr,jump,beq;
        case({jr,jump,beq})
            3'b000:select=2'b0;
            3'b001:select=2'b1;
            3'b010:select=2'b10;
            3'b100:select=2'b11;
        endcase
    endfunction
    assign out=select(jr,jump,beq);
endmodule