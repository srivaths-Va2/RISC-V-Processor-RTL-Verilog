/*
This module can perform instruction decoding for all J-type instructions
The module outputs the register address rd and 20 bit immediate value imm after decoding
*/

module INST_J_DEC (
    input[31:0] instruction_word,
    output reg[19:0] imm,
    output reg[4:0] rd
);

    always@(instruction_word)
        begin
            imm = instruction_word[31:12];
            rd = instruction_word[11:7];
        end
    
endmodule