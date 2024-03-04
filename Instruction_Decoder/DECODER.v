/*
This module is the DECODER block of the processor.
It combines the submodules developed for the 6 instruction types to realise a full fledged decoder unit

INPUT
1) instruction_word[31:0]

OUTPUT will depend on the DECODER block chosen by a DEMUX (conceptualization), which routes the instruction word based on the control signal inst_type
*/

// Appending the 6 decoder files in the main module

module DECODER (
    input[31:0] instruction_word,
    //input[2:0] inst_type,
    output reg[6:0] imm_B_MSB,
    output reg[4:0] imm_B_LSB,
    output reg[11:0] imm_I,
    output reg[19:0] imm_J,
    output reg[6:0] imm_S_MSB,
    output reg[4:0] imm_S_LSB,
    output reg[19:0] imm_U,
    output reg[4:0] rd,
    output reg[4:0] rs2,
    output reg[4:0] rs1
);

    always@(instruction_word)
        begin
            // Initialising the registers of default dont care values
            imm_B_MSB = 7'bx;
            imm_B_LSB = 5'bx;
            imm_I = 12'bx;
            imm_J = 20'bx;
            imm_S_MSB = 7'bx;
            imm_S_LSB = 5'bx;
            imm_U = 20'bx;

            rd = 5'bx;
            rs2 = 5'bx;
            rs1 = 5'bx;

            // Assigning outputs based on the value of inst_type control signal

            case (instruction_word[6:0])
                7'b1100011 : begin 
                    imm_B_MSB = instruction_word[31:25];
                    rs2 = instruction_word[24:20];
                    rs2 = instruction_word[19:15];
                    imm_B_LSB = instruction_word[11:7]; 
                    end
                7'b0000011 : begin 
                    imm_I = instruction_word[31:20];
                    rs1 = instruction_word[19:15];
                    rd = instruction_word[11:7];
                    end
                7'b1101111 : begin 
                    imm_J = instruction_word[31:12];
                    rd = instruction_word[11:7];
                    end
                7'b0110011 : begin 
                    rs2 = instruction_word[24:20];
                    rs1 = instruction_word[19:15];
                    rd = instruction_word[11:7];
                    end
                7'b0100011 : begin  
                    imm_S_MSB = instruction_word[31:25];
                    rs2 = instruction_word[24:20];
                    rs1 = instruction_word[19:15];
                    imm_S_LSB = instruction_word[11:7];
                    end
                7'b0110111 : begin 
                    imm_U = instruction_word[31:12];
                    rd = instruction_word[11:7];
                    end
            endcase


        end
    
endmodule