/*
This module is the DATAPATH module, which inputs the signals from CONTROL unit and DECODER unit, and performs operations accordingly

The arithemetic processing is performed using the ALU module

The module then outputs the result along with CONTROL signals to accrodingly store the data into the Register File of the 
processor
*/

module DATAPATH_v2 (
    // Input the 32 bit program counter
    //input[31:0] PC,
    // define the data from DECODER
    input[6:0] imm_B_MSB,
    input[4:0] imm_B_LSB,
    input[11:0] imm_I,
    input[19:0] imm_J,
    input[6:0] imm_S_MSB,
    input[4:0] imm_S_LSB,
    input[19:0] imm_U,
    input[4:0] rd,
    input[4:0] rs2,
    input[4:0] rs1,

    // defining the control signals from CONTROL
    input[3:0] alu_ctrl,
    input shamt_en,        // control strobe for shift amount for I-type instructions
    input[2:0] branch_ctrl, 
    input jump_ctrl,       // control strobe to indicate JUMP instruction
    input reg_write,
    input[2:0] inst_type

    // defining the output signals from the datapath unit

);

/*************************** FUNCTION TO LOAD AND STORE INTO AND FROM THE REGISTER FILE ***************************************************/

function [31:0] LOAD(input[4:0] r_addr, output reg[31:0] r_val)
    ;

    reg[31:0] risc_v_memory_reg[31:0];
    //reg[31:0] r_val;

    //always@(r_addr)
        //begin
    case(r_addr)
        5'b00000 : r_val = risc_v_memory_reg[0];
        5'b00001 : r_val = risc_v_memory_reg[1];
        5'b00010 : r_val = risc_v_memory_reg[2];
        5'b00011 : r_val = risc_v_memory_reg[3];
        5'b00100 : r_val = risc_v_memory_reg[4];
        5'b00101 : r_val = risc_v_memory_reg[5];
        5'b00110 : r_val = risc_v_memory_reg[6];
        5'b00111 : r_val = risc_v_memory_reg[7];
        5'b01000 : r_val = risc_v_memory_reg[8];
        5'b01001 : r_val = risc_v_memory_reg[9];
        5'b01010 : r_val = risc_v_memory_reg[10];
        5'b01011 : r_val = risc_v_memory_reg[11];
        5'b01100 : r_val = risc_v_memory_reg[12];
        5'b01101 : r_val = risc_v_memory_reg[13];
        5'b01110 : r_val = risc_v_memory_reg[14];
        5'b01111 : r_val = risc_v_memory_reg[15];
        5'b10000 : r_val = risc_v_memory_reg[16];
        5'b10001 : r_val = risc_v_memory_reg[17];
        5'b10010 : r_val = risc_v_memory_reg[18];
        5'b10011 : r_val = risc_v_memory_reg[19];
        5'b10100 : r_val = risc_v_memory_reg[20];
        5'b10101 : r_val = risc_v_memory_reg[21];
        5'b10110 : r_val = risc_v_memory_reg[22];
        5'b10111 : r_val = risc_v_memory_reg[23];
        5'b11000 : r_val = risc_v_memory_reg[24];
        5'b11001 : r_val = risc_v_memory_reg[25];
        5'b11010 : r_val = risc_v_memory_reg[26];
        5'b11011 : r_val = risc_v_memory_reg[27];
        5'b11100 : r_val = risc_v_memory_reg[28];
        5'b11101 : r_val = risc_v_memory_reg[29];
        5'b11110 : r_val = risc_v_memory_reg[30];
        5'b11111 : r_val = risc_v_memory_reg[31];
    endcase
        //end
    
    //return r_val;
    
endfunction


function [31:0] STORE(input[4:0] r_addr, input[31:0] r_val);

    reg[31:0] risc_v_memory_reg[31:0];

    //always@(*)
        //begin
    case(r_addr)
        5'b00000 : risc_v_memory_reg[0] = r_val;
        5'b00001 : risc_v_memory_reg[1] = r_val;
        5'b00010 : risc_v_memory_reg[2] = r_val;
        5'b00011 : risc_v_memory_reg[3] = r_val;
        5'b00100 : risc_v_memory_reg[4] = r_val;
        5'b00101 : risc_v_memory_reg[5] = r_val;
        5'b00110 : risc_v_memory_reg[6] = r_val;
        5'b00111 : risc_v_memory_reg[7] = r_val;
        5'b01000 : risc_v_memory_reg[8] = r_val;
        5'b01001 : risc_v_memory_reg[9] = r_val;
        5'b01010 : risc_v_memory_reg[10] = r_val;
        5'b01011 : risc_v_memory_reg[11] = r_val;
        5'b01100 : risc_v_memory_reg[12] = r_val;
        5'b01101 : risc_v_memory_reg[13] = r_val;
        5'b01110 : risc_v_memory_reg[14] = r_val;
        5'b01111 : risc_v_memory_reg[15] = r_val;
        5'b10000 : risc_v_memory_reg[16] = r_val;
        5'b10001 : risc_v_memory_reg[17] = r_val;
        5'b10010 : risc_v_memory_reg[18] = r_val;
        5'b10011 : risc_v_memory_reg[19] = r_val;
        5'b10100 : risc_v_memory_reg[20] = r_val;
        5'b10101 : risc_v_memory_reg[21] = r_val;
        5'b10110 : risc_v_memory_reg[22] = r_val;
        5'b10111 : risc_v_memory_reg[23] = r_val;
        5'b11000 : risc_v_memory_reg[24] = r_val;
        5'b11001 : risc_v_memory_reg[25] = r_val;
        5'b11010 : risc_v_memory_reg[26] = r_val;
        5'b11011 : risc_v_memory_reg[27] = r_val;
        5'b11100 : risc_v_memory_reg[28] = r_val;
        5'b11101 : risc_v_memory_reg[29] = r_val;
        5'b11110 : risc_v_memory_reg[30] = r_val;
        5'b11111 : risc_v_memory_reg[31] = r_val;
    endcase
        //end
    
endfunction


// intermediate values for data retrieved from memory
reg[31:0] rs1_val;
reg[31:0] rs2_val;
wire[31:0] rd_val;

always@(*)
    begin
        // To handle R-type instructions
        if(inst_type == 3'b000)
            begin
                if(alu_ctrl == 4'b0010)         // ADD
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the sum and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val + rs2_val;

                        STORE(rd, rd_val);


                    end

                else if(alu_ctrl == 4'b0100)    // SUB
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the difference and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val - rs2_val;

                        STORE(rd, rd_val);


                    end
                
                else if(alu_ctrl == 4'b0011)    // SLL
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the SLL and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val << rs2_val;

                        STORE(rd, rd_val);
                    end
                
                else if(alu_ctrl == 4'b1000)    // SLT
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the SLT and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        if(rs1_val < rs2_val)
                            begin
                                rd_val = 1'b1;
                                STORE(rd, rd_val);
                            end
                        
                        else
                            begin
                                rd_val = 1'b0;
                                STORE(rd, rd_val);
                            end
                    end
                
                else if(alu_ctrl == 4'b0111)    // XOR
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the XOR and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val ^ rs2_val;

                        STORE(rd, rd_val);
                    end
                
                else if(alu_ctrl == 4'b0101)    // SRL
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the SRL and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val >> rs2_val;

                        STORE(rd, rd_val);
                    end
                
                else if(alu_ctrl == 4'b1001)    // SRA
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the SRA and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val >>> rs2_val;

                        STORE(rd, rd_val);
                    end
                
                else if(alu_ctrl == 4'b0001)        // OR
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the OR and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val | rs2_val;

                        STORE(rd, rd_val);
                    end
                
                else if(alu_ctrl == 4'b0000)            // AND
                    begin
                        /* Load the values of rs1 into rs1_val, rs2 into rs2_val
                        Compute the AND and store in rd_val
                        store rd_val into register at rd
                        throw status saying process complete so that PC can go to next instruction
                        */

                        rs1_val = LOAD(rs1);
                        rs2_val = LOAD(rs2);

                        rd_val = rs1_val & rs2_val;

                        STORE(rd, rd_val);
                    end
            end
        

        // To handle U-type instructions
        /*if(inst_type == 3'b001)
        begin
            /*
            Implement the lui instruction for now
            */
           /* rd_val = imm_U << 12;
            STORE(rd, rd_val);

        end

        // To handle J-Type instructions
        if(inst_type == 3'b010)
        begin
            /*
            Implement the jal instruction
            */
           /* rd_val = (PC + 32'b4);          // Storing current instruction to be executed into rd
            STORE(rd, rd_val);
            PC = PC + imm_J;                // Jumping to the next address

        end

        // To implement I-type instructions
        if(inst_type == 3'b011)
        begin

        end*/
        
    end
    
endmodule