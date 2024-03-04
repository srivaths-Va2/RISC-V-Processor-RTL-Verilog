`timescale 1ns/1ns
`include "INST_I_DEC.v"

module INST_I_DEC_tb;
reg[31:0] instruction_word;
wire[11:0] imm_I;
wire[4:0] rs1;
wire[4:0] rd;

INST_I_DEC I_Decoder(instruction_word, imm_I, rs1, rd);

initial
    begin
        $dumpfile("INST_I_DEC_tb.vcd");
        $dumpvars(0, INST_I_DEC_tb);

        // I type instructions
        instruction_word = 32'b001000001001_10011_000_00111_0000011;
        #20;

        instruction_word = 32'b011101101101_00001_111_00110_0000011;
        #20;

        instruction_word = 32'b000011110101_01101_101_01101_0000011;
        #20;

        instruction_word = 32'b000011110101_01101_011_01101_0000011;
        #20;


    end

endmodule