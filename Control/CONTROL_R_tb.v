`timescale 1ns/1ns
`include "CONTROL_R.v"

module CONTROL_R_tb;
reg[31:0] instruction_word;
wire[3:0] alu_ctrl;
wire reg_write;

CONTROL_R control_unit (
    .instruction_word(instruction_word),
    .alu_ctrl(alu_ctrl),
    .reg_write(reg_write)
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

    instruction_word = 32'b0000000_00100_10101_000_00101_0110011;
    #20;

    instruction_word = 32'b0100000_00101_10101_000_00110_0110011;
    #20;

    instruction_word = 32'b0000000_00100_10101_001_00101_0110011;
    #20;

    $display("Test Complete");
    $finish;
end

endmodule
