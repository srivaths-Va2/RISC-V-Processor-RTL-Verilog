/*
Module to perform load ad store of data into peocessor registers

Module uses control signal , ld_str to control load and store operations
if ld_str == 1, we load from the processor register
If ld_str == 0, we store data into the processor register

*/

//`include "REGISTER.v"

module LOAD_STORE (
    input clk,
    input reset,
    input ld_str,               // ld_str == 1 => LOAD, ld_str == 0 => STORE
    input[4:0] register_addr,
    input[31:0] store_val,
    output reg[31:0] load_val

);

    reg index;

    //wire[31:0] load_val;

    // initialising the registers
    reg[31:0] risc_v_memory_reg[31:0];

    // initializing the processor with random values upon reset assertion. Kept the values to 32'h0
    always@(posedge reset)
        begin
            risc_v_memory_reg[0] = 32'h0;
            risc_v_memory_reg[1] = 32'h0;
            risc_v_memory_reg[2] = 32'h0;
            risc_v_memory_reg[3] = 32'h0;
            risc_v_memory_reg[4] = 32'h0;
            risc_v_memory_reg[5] = 32'h0;
            risc_v_memory_reg[6] = 32'h0;
            risc_v_memory_reg[7] = 32'h0;
            risc_v_memory_reg[8] = 32'h0;
            risc_v_memory_reg[9] = 32'h0;
            risc_v_memory_reg[10] = 32'h0;
            risc_v_memory_reg[11] = 32'h0;
            risc_v_memory_reg[12] = 32'h0;
            risc_v_memory_reg[13] = 32'h0;
            risc_v_memory_reg[14] = 32'h0;
            risc_v_memory_reg[15] = 32'h0;
            risc_v_memory_reg[16] = 32'h0;
            risc_v_memory_reg[17] = 32'h0;
            risc_v_memory_reg[18] = 32'h0;
            risc_v_memory_reg[19] = 32'h0;
            risc_v_memory_reg[20] = 32'h0;
            risc_v_memory_reg[21] = 32'h0;
            risc_v_memory_reg[22] = 32'h0;
            risc_v_memory_reg[23] = 32'h0;
            risc_v_memory_reg[24] = 32'h0;
            risc_v_memory_reg[25] = 32'h0;
            risc_v_memory_reg[26] = 32'h0;
            risc_v_memory_reg[27] = 32'h0;
            risc_v_memory_reg[28] = 32'h0;
            risc_v_memory_reg[29] = 32'h0;
            risc_v_memory_reg[30] = 32'h0;
            risc_v_memory_reg[31] = 32'h0;
        end


    // assigning the index based on processor address

    always@(register_addr)
    begin
        case(register_addr)
            //begin
                5'b00000 : index = 0;
                5'b00001 : index = 1;
                5'b00010 : index = 2;
                5'b00011 : index = 3;
                5'b00100 : index = 4;
                5'b00101 : index = 5;
                5'b00110 : index = 6;
                5'b00111 : index = 7;
                5'b01000 : index = 8;
                5'b01001 : index = 9;
                5'b01010 : index = 10;
                5'b01011 : index = 11;
                5'b01100 : index = 12;
                5'b01101 : index = 13;
                5'b01110 : index = 14;
                5'b01111 : index = 15;
                5'b10000 : index = 16;
                5'b10001 : index = 17;
                5'b10010 : index = 18;
                5'b10011 : index = 19;
                5'b10100 : index = 20;
                5'b10101 : index = 21;
                5'b10110 : index = 22;
                5'b10111 : index = 23;
                5'b11000 : index = 24;
                5'b11001 : index = 25;
                5'b11010 : index = 26;
                5'b11011 : index = 27;
                5'b11100 : index = 28;
                5'b11101 : index = 29;
                5'b11110 : index = 30;
                5'b11111 : index = 31;
            //end

        endcase
    end


    /*
    initial
        begin
            assign ld_str = 1'b0;
            assign register_addr = 5'b0;
        end
    */

    always@(posedge clk or negedge ld_str)
        begin
            if(ld_str == 1'b1)
                begin
                    load_val <= risc_v_memory_reg[index];
                end
            
            else if(ld_str == 1'b0)
                begin
                    risc_v_memory_reg[index] <= store_val;
                end
        end

    
endmodule