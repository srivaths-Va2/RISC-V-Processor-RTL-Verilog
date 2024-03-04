/*
This module can perform instruction decoding for all S-type instructions
The module outputs the register addresses, MSB and LSB immediate values after decoding
*/

module INST_S_DEC (
    input[31:0] instruction_word,
    output reg[6:0] imm_S_MSB,
    output reg[4:0] rs2,
    output reg[4:0] rs1,
    output reg[4:0] imm_S_LSB
);

    always@(instruction_word)
        begin
            imm_S_MSB = instruction_word[31:25];
            rs2 = instruction_word[24:20];
            rs1 = instruction_word[19:15];
            imm_S_LSB = instruction_word[11:7];
        end
    
endmodule