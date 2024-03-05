/*
Module to implement a simple Instruction-Fetch Unit.
*/

`include "INST_MEMORY.v"

module IFU (
    input clk,
    input reset,
    output[31:0] instruction_word
);


    // Initialising the INST_MEMORY module internally
    INST_MEMORY instruction_memory(PC, reset, instruction_word);

    // Initializing the PC
    reg[31:0] PC = 32'b0;

    always@(posedge clk, posedge reset)
        begin
            if(reset == 1'b1)
                PC <= 32'b0;            // Reset PC to 0
            else if(reset == 1'b0)
                PC <= PC + 1;           // Set PC to PC+1 to point to next instruction
        end

    
endmodule