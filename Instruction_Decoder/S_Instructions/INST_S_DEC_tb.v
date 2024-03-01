`timescale 1ns/1ns
`include "INST_S_DEC.v"

module INST_S_DEC_tb;
reg[31:0] instruction_word;
wire[6:0] imm_MSB;
wire[4:0] rs2;
wire[4:0] rs1;
wire[4:0] imm_LSB;

INST_S_DEC S_Decoder(instruction_word, imm_MSB, rs2, rs1, imm_LSB);

initial
    begin
        $dumpfile("INST_S_DEC_tb.vcd");
        $dumpvars(0, INST_S_DEC_tb);

        // S type instructions testing
        instruction_word = 32'b0000111_00000_01101_010_11101_0100011;
        #20;

        instruction_word = 32'b0100101_10101_01100_010_01111_0100011;
        #20;

        instruction_word = 32'b1000100_01011_00111_010_00001_0100011;
        #20;

    end

endmodule