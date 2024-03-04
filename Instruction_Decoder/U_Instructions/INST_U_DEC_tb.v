`timescale 1ns/1ns
`include "INST_U_DEC.v"

module INST_U_DEC_tb;
reg[31:0] instruction_word;
wire[19:0] imm_U;
wire[4:0] rd;


INST_U_DEC R_Decoder(instruction_word, imm_U, rd);

initial
    begin
        $dumpfile("INST_U_DEC_tb.vcd");
        $dumpvars(0, INST_U_DEC_tb);

        // U-type instructions
        instruction_word = 32'b00001111010101101011_01101_0110111;
        #20;

        instruction_word = 32'b10001011010101001001_10101_0110111;
        #20;

    end

endmodule