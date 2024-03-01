`timescale 1ns/1ns
`include "CONTROL_R.v"

module CONTROL_R_tb;
reg[31:0] instruction_word;
wire[3:0] alu_ctrl;
wire shamt_en;
wire[2:0] branch_ctrl;
wire jump_ctrl;
wire reg_write;
wire[2:0] inst_type;

CONTROL_R control_unit (
    .instruction_word(instruction_word),
    .alu_ctrl(alu_ctrl),
    .shamt_en(shamt_en),
    .branch_ctrl(branch_ctrl),
    .jump_ctrl(jump_ctrl),
    .reg_write(reg_write),
    .inst_type(inst_type)
);

/*
initial
    begin
        assign instruction_word = 32'b0;
    end
*/

initial
begin
    $dumpfile("CONTROL_R_tb.vcd");
    $dumpvars(0, CONTROL_R_tb);

    // R type instructions testing
    instruction_word = 32'b0000000_00100_10101_000_00101_0110011;
    #20;

    instruction_word = 32'b0100000_00101_10101_000_00110_0110011;
    #20;

    instruction_word = 32'b0000000_00100_10101_001_00101_0110011;
    #20;

    // I type instructions testing
    instruction_word = 32'b001000001001_10011_000_00111_0000011;
    #20;

    instruction_word = 32'b011101101101_00001_111_00110_0000011;
    #20;

    instruction_word = 32'b000011110101_01101_101_01101_0000011;
    #20;

    instruction_word = 32'b000011110101_01101_011_01101_0000011;
    #20;

    // U-type instructions
    instruction_word = 32'b00001111010101101011_01101_0110111;
    #20;

    // S-type instructions
    instruction_word = 32'b0000111_10101_01101_010_01101_0100011;
    #20;

    // B-type instructions
    instruction_word = 32'b0000111_10101_01101_111_01101_1100011;
    #20;

    instruction_word = 32'b0000111_10101_01101_100_01101_1100011;
    #20;

    // J-type instructions
    instruction_word = 32'b0000111_10101_01101_111_01101_1101111;
    #20;

    $display("Test Complete");
    $finish;
end

endmodule
