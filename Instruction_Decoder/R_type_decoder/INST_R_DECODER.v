/*
This module can perform instruction decoding for all R-type instructions
The module outputs the register addresses after decoding
*/

module INST_R_DECODER (
    input[31:0] instruction_word,
    output reg[4:0] rs2,
    output reg[4:0] rs1,
    output reg[4:0] rd
);

    always@(instruction_word)
        begin
            rs2 = instruction_word[24:20];
            rs1 = instruction_word[19:15];
            rd = instruction_word[11:7];
        end
    
endmodule