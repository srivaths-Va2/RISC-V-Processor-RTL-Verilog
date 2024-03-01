/*
This module can perform instruction decoding for all I-type instructions
The module outputs the register addresses and shift amount after decoding
*/

module INST_I_DEC (
    input[31:0] instruction_word,
    output reg[11:0] imm,
    output reg[4:0] rs1,
    output reg[4:0] rd
);

    always@(instruction_word)
        begin
            imm = instruction_word[31:20];
            rs1 = instruction_word[19:15];
            rd = instruction_word[11:7];
        end
    
endmodule