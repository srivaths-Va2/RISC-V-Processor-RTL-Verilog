/*
The module covers the implementation of RISC-V processor internal registers. The ISA specifies 32 registers in the archutecture
The width of each register is 32 bits
Hence, we require 5 bits to address each register

Functions covered
1) Register Read : In this function, we read from a register addressed by its address
2) Register Write : In this function, we write to a register addressed by its address
*/


module REGISTER (
    input clk, reset,
    input[4:0] register_read_addr_1,
    input[4:0] register_read_addr_2,
    input[4:0] register_write_addr,
    input r_or_w,                           // for READ, r_or_w = 1 and for WRITE, r_or_w = 0
    input[31:0] write_reg_val,
    output reg[31:0] read_reg_value_1,
    output reg[31:0] read_reg_value_2
    //output[31:0] write_reg_value
);

    reg[31:0] risc_v_memory_reg[31:0];       // intiialising the RISC-V processor memory with 32 registers each of 32 bits wide

    //reg arr_idx = 1'dregister_write_addr;

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

    always@(posedge clk)
        // upon read operation, the data to be read will be outputted
        if(r_or_w == 1)
            begin
                read_reg_value_1 <= risc_v_memory_reg[register_read_addr_1];
                read_reg_value_2 <= risc_v_memory_reg[register_read_addr_2];
            end
        
        // upon write operation, the data to be written is written to corresponding register
        else if(r_or_w == 0)
            begin
                case(register_write_addr)
                    5'b00000 : risc_v_memory_reg[0] = write_reg_val;
                    5'b00001 : risc_v_memory_reg[1] = write_reg_val;
                    5'b00010 : risc_v_memory_reg[2] = write_reg_val;
                    5'b00011 : risc_v_memory_reg[3] = write_reg_val;
                    5'b00100 : risc_v_memory_reg[4] = write_reg_val;
                    5'b00101 : risc_v_memory_reg[5] = write_reg_val;
                    5'b00110 : risc_v_memory_reg[6] = write_reg_val;
                    5'b00111 : risc_v_memory_reg[7] = write_reg_val;
                    5'b01000 : risc_v_memory_reg[8] = write_reg_val;
                    5'b01001 : risc_v_memory_reg[9] = write_reg_val;
                    5'b01010 : risc_v_memory_reg[10] = write_reg_val;
                    5'b01011 : risc_v_memory_reg[11] = write_reg_val;
                    5'b01100 : risc_v_memory_reg[12] = write_reg_val;
                    5'b01101 : risc_v_memory_reg[13] = write_reg_val;
                    5'b01110 : risc_v_memory_reg[14] = write_reg_val;
                    5'b01111 : risc_v_memory_reg[15] = write_reg_val;
                    5'b10000 : risc_v_memory_reg[16] = write_reg_val;
                    5'b10001 : risc_v_memory_reg[17] = write_reg_val;
                    5'b10010 : risc_v_memory_reg[18] = write_reg_val;
                    5'b10011 : risc_v_memory_reg[19] = write_reg_val;
                    5'b10100 : risc_v_memory_reg[20] = write_reg_val;
                    5'b10101 : risc_v_memory_reg[21] = write_reg_val;
                    5'b10110 : risc_v_memory_reg[22] = write_reg_val;
                    5'b10111 : risc_v_memory_reg[23] = write_reg_val;
                    5'b11000 : risc_v_memory_reg[24] = write_reg_val;
                    5'b11001 : risc_v_memory_reg[25] = write_reg_val;
                    5'b11010 : risc_v_memory_reg[26] = write_reg_val;
                    5'b11011 : risc_v_memory_reg[27] = write_reg_val;
                    5'b11100 : risc_v_memory_reg[28] = write_reg_val;
                    5'b11101 : risc_v_memory_reg[29] = write_reg_val;
                    5'b11110 : risc_v_memory_reg[30] = write_reg_val;
                    5'b11111 : risc_v_memory_reg[31] = write_reg_val;
                endcase
            end

    
endmodule