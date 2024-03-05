// Instruction_Memory testbench code

`timescale 1ns/1ns
`include "INST_MEMORY.v"

module INST_MEMORY_tb;

reg[31:0] PC;
reg reset;
wire[31:0] instruction_code;

INST_MEMORY inst_memory(PC, reset, instruction_code);

initial
    begin
        $dumpfile("INST_MEMORY_tb.vcd");
        $dumpvars(0, INST_MEMORY_tb);

        reset = 1'b1;
        #20;

        reset = 1'b0;
        PC = 32'b1;
        #20;

        reset = 1'b0;
        PC = 32'b10;
        #20;

        reset = 1'b0;
        PC = 32'b11;
        #20;

        reset = 1'b0;
        PC = 32'b100;
        #20;

        reset = 1'b0;
        PC = 32'b101;
        #20;

        reset = 1'b0;
        PC = 32'b110;
        #20;

        $display("Test complete!");
        $finish;
    end

endmodule;

