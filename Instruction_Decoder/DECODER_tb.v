/*
Module is the testbench for the main decoder block
*/

`timescale 1ns/1ns
`include "DECODER.v"

module DECODER_tb;
reg[31:0] instruction_word;
wire[6:0] imm_B_MSB;
wire[4:0] imm_B_LSB;
wire[11:0] imm_I;
wire[19:0] imm_J;
wire[6:0] imm_S_MSB;
wire[4:0] imm_S_LSB;
wire[19:0] imm_U;
wire[4:0] rd;
wire[4:0] rs2;
wire[4:0] rs1;

// Instantiaiton of the decoder block

DECODER decoder(instruction_word, imm_B_MSB, imm_B_LSB, imm_I, imm_J, imm_S_MSB, imm_S_LSB, imm_U, rd, rs2, rs1);

initial
    begin
        $dumpfile("DECODER.vcd");
        $dumpvars(0, DECODER_tb);

        // B-type instructions
        instruction_word = 32'b0000111_10101_01101_111_01101_1100011;
        #20;

        // I type instructions
        instruction_word = 32'b001000001001_10011_000_00111_0000011;
        #20;

        // J-type instructions
        instruction_word = 32'b00001111110101101110_01101_1101111;
        #20;

        // R type instructions testing
        instruction_word = 32'b0000000_00100_10101_000_00101_0110011;
        #20;

        // S type instructions testing
        instruction_word = 32'b0000111_00000_01101_010_11101_0100011;
        #20;

        // U-type instructions
        instruction_word = 32'b00001111010101101011_01101_0110111;
        #20;
        
        $display("Test complete!");
        $finish;

    end

endmodule