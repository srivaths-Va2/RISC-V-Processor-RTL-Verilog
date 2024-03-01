/*
The module depicts the control unit of the processor. 
The control unit takes in the opcode, funct7 and funct3 as the inputs and determines the control register write in 
the IFU and the ALU control in the ALU for the proper execution of the instruction

The module outputs control instructions for-
1) R-type instructions (Register Type intructions)
2) U-type instructions 
3) J-type instructions
4) I-type instructions
5) S-type instructions
6) B-type instructions



*/


module CONTROL_R(
    input[31:0] instruction_word,
    output reg[3:0] alu_ctrl,
    output reg reg_write
);
    
    always@(instruction_word[6:0] or instruction_word[14:12] or instruction_word[31:25])
        begin
            //coding for R type instructions
            if(instruction_word[6:0] == 7'b0110011) begin
                reg_write = 1;

                case(instruction_word[14:12])
                    3'b000 : begin
                        if(instruction_word[31:25] == 7'b0000000)
                            alu_ctrl = 4'b0010;     // ADD
                        else if(instruction_word[31:25] == 7'b0100000)
                            alu_ctrl = 4'b0100;     // SUB        
                    end 

                    3'b001 : alu_ctrl = 4'b0011;    // SLL (Shift Left Logical)
                    3'b010 : alu_ctrl = 4'b1000;    // SLT (Set Less Than)
                    3'b100 : alu_ctrl = 4'b0111;    // XOR (Bitwise XOR)
                    3'b101 : begin
                        if(instruction_word[31:25] == 7'b0000000)
                            alu_ctrl = 4'b0101;    // SRL (Shift Right Logical)
                        else if(instruction_word[31:25] == 7'b0100000)
                            alu_ctrl = 4'b1001;     // SRA (Shift Right Arithemetic)
                    end
                    3'b110 : alu_ctrl = 4'b0001;    // OR (Bitwise OR)
                    3'b111 : alu_ctrl = 4'b0000;    // AND (Bitwise AND)
                    
                endcase
            end
            
           /*
            // Coding for U-type instructions
            if(opcode == 7'b0110111)
                case

                endcase

        end
        */
        end

endmodule