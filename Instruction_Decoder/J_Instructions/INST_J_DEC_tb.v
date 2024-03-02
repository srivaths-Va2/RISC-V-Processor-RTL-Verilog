`timescale 1ns/1ns
`include "INST_J_DEC.v"

module INST_J_DEC_tb;
reg [31:0] instruction_word;
wire[19:0] imm;
wire[4:0] rd;

INST_J_DEC J_Decoder(instruction_word, imm, rd);

initial
    begin
        $dumpfile("INST_J_DEC_tb.vcd");
        $dumpvars(0, INST_J_DEC_tb);

        // J-type instructions

        instruction_word = 32'b00001111110101101110_01101_1101111;
        #20;

        instruction_word = 32'b01001110010101101111_11111_1101111;
        #20;

        instruction_word = 32'b00001111010101101111_00101_1101111;
        #20;

        instruction_word = 32'b11001110010101001111_00100_1101111;
        #20;
    end

endmodule