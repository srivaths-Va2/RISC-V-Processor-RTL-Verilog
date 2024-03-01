`timescale 1ns/1ns
`include "INST_R_DECODER.v"

module INST_R_DECODER_tb;
reg[31:0] instruction_word;
wire[4:0] rs2;
wire[4:0] rs1;
wire[4:0] rd;

INST_R_DECODER R_Decoder(instruction_word, rs2, rs1, rd);

initial
    begin
        $dumpfile("INST_R_DECODER_tb.vcd");
        $dumpvars(0, INST_R_DECODER_tb);

        // R type instructions testing
        instruction_word = 32'b0000000_00100_10101_000_00101_0110011;
        #20;

        instruction_word = 32'b0100000_00101_10101_000_00110_0110011;
        #20;

        instruction_word = 32'b0000000_00100_10100_001_00101_0110011;
        #20;

    end

endmodule