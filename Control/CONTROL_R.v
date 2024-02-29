/*
The module depicts the control unit of the processor. 
The control unit takes in the opcode, funct7 and funct3 as the inputs and determines the control register write in 
the IFU and the ALU control in the ALU for the proper execution of the instruction

The module outputs control instructions for R-type instructions (Register Type intructions) for the processor



*/


module CONTROL_R (
    input[6:0] opcode,
    input[2:0] funct3,
    input[6:0] funct7,
    output reg[3:0] alu_ctrl,
    output reg reg_write
);
    
    always@(funct7 or funct3 or opcode)
        begin
            //coding for R type instructions
            if(opcode == 7'b0110011)
                reg_write = 1;

                case(funct3)
                    3'b000 : begin
                        if(funct7 == 7'b0000000)
                            alu_ctrl = 4'b0010;     // ADD
                        else if(funct7 == 7'b0100000)
                            alu_ctrl = 4'b0100;     // SUB        
                    end 

                    3'b001 : alu_ctrl = 4'b0011;    // SLL (Shift Left Logical)
                    3'b010 : alu_ctrl = 4'b1000;    // SLT (Set Less Than)
                    3'b100 : alu_ctrl = 4'b0111;    // XOR (Bitwise XOR)
                    3'b101 : alu_ctrl = 4'b0101;    // SRL (Shift Right Logical)
                    3'b110 : alu_ctrl = 4'b0001;    // OR (Bitwise OR)
                    3'b111 : alu_ctrl = 4'b0000;    // AND (Bitwise AND)
                    
                endcase
            
            // Coding for U-type instructions
            if(opcode == 7'b0110111)
                case

                endcase

        end

endmodule