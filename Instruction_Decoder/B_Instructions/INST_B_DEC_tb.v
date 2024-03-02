`timescale 1ns/1ns
`include "INST_B_DEC.v"

module INST_B_DEC_tb;
reg[31:0] instruction_word;
wire[6:0] imm_MSB;
wire[4:0] rs2;
wire[4:0] rs1;
wire[4:0] imm_LSB;

INST_B_DEC B_Decoder(instruction_word, imm_MSB, rs2, rs1, imm_LSB);

initial
    begin
        $dumpfile("INST_B_DEC_tb.vcd");
        $dumpvars(0, INST_B_DEC_tb);

        // B-type instructions
        instruction_word = 32'b0000111_10101_01101_111_01101_1100011;
        #20;

        instruction_word = 32'b1010101_11100_00110_100_11101_1100011;
        #20;

        instruction_word = 32'b1000100_00100_10111_000_11111_1100011;
        #20;


    end

endmodule