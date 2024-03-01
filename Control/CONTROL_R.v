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

the signal inst_type gives information of the encoding of the instruction. 

inst_type       |       Encoding
3'b000                  R
3'b001                  U
3'b010                  J
3'b011                  I
3'b100                  S
3'b101                  B

*/


module CONTROL_R(
    input[31:0] instruction_word,
    output reg[3:0] alu_ctrl,
    output reg shamt_en,        // control strobe for shift amount for I-type instructions
    output reg reg_write,
    output reg[2:0] inst_type
);
    
    always@(instruction_word)
        begin
            //coding for R type instructions
            if(instruction_word[6:0] == 7'b0110011) begin
                reg_write = 1;
                inst_type = 3'b000;

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
            else if(instruction_word[6:0] == 7'b0000011)
                begin
                    reg_write = 1'b1;
                    //r_or_w = 1'b0;      // write operation to store value enabled (LUI and AUIPC)
                    inst_type = 3'b011;
                end
                */
            
            // coding for I-type instructions
            else if(instruction_word[6:0] == 7'b0000011)
                begin
                    reg_write = 1'b1;
                    inst_type = 3'b011;
                    shamt_en = 1'b0;
                    alu_ctrl = 4'b0000;

                    case(instruction_word[14:12])
                        3'b000 : alu_ctrl = 4'b0010;
                        3'b001 : begin
                            alu_ctrl = 4'b0011;
                            shamt_en = 1'b1;
                        end
                        3'b010 : alu_ctrl = 4'b1000;
                        3'b011 : alu_ctrl = 4'b0111;
                        3'b100 : alu_ctrl = 4'b0001;
                        3'b101 : begin
                            shamt_en = 1'b1;
                            if(instruction_word[31:25] == 7'b0000000)
                                assign alu_ctrl = 4'b0101;
                            else if(instruction_word[31:25] == 7'b0100000)
                                assign alu_ctrl = 4'b1001;
                        end
                        3'b110 : alu_ctrl = 4'b0001;
                        3'b111 : alu_ctrl = 4'b0010;
                    endcase

                end
            
            // coding for U-type instructions
            else if(instruction_word[6:0] == 7'b0110111)
                begin
                    inst_type = 3'b001;
                    //alu_ctrl = 4'bxxxx;
                    alu_ctrl = 4'b0011;
                end
            
            // coding for S-type instructions
            else if(instruction_word[6:0] == 7'b0100011)
                begin
                    inst_type = 3'b100;
                    
                end


                
        end

endmodule