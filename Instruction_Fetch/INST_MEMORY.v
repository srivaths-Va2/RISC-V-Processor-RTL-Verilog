/*
Code for the instruction memory for the RISC-V processor.
The instruction memory comprises of 10 registers, each of 32 bit width

IMPORTANT - THIS IS A VERY NAIVE INSTRUCTION MEMORY. ONCE THE PROCESSOR IS COMPLETE-
1) INCREASE THE MEMORY SPACE OF INSTRUCTION MEMORY
2) IMPLEMENT A BOOTLOADER PROGRAM TO INTIALISE THE PROCESSOR AND SET THE INSTRUCTION MEMORY UPON PROCESSOR RESET
*/

module INST_MEMORY (
    input[31:0] PC,
    input reset,
    output[31:0] instruction_word
);

    reg[31:0] Memory[9:0];       // Initialising an instruction memory of 10 registers, each of 32 bit length

    // Under normal operation, assign instruction_word to Memory[PC]

    assign instruction_word = Memory[PC];

    // If processor is reset, assign dummy instructions to memory.
    // IMPORTANT - ONCE THE ENTIRE PROCESSOR IS REALISED, INSTEAD OF DUMMY INITIAL INSTRUCTIONS, WRITE BOOTLOADER INSTRUCTIONS TO INITIALISE THE PROCESSOR
    always@(reset)
        begin
            if(reset == 1'b1)
                begin
                    Memory[0] = 32'b0;
                    Memory[1] = 32'b01;
                    Memory[2] = 32'b10;
                    Memory[3] = 32'b11;
                    Memory[4] = 32'b100;
                    Memory[5] = 32'b101;
                    Memory[6] = 32'b110;
                    Memory[7] = 32'b111;
                    Memory[8] = 32'b1000;
                    Memory[9] = 32'b1001;
                end
        end
    
endmodule