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
    input[4:0] register_read_addr,
    input[4:0] register_write_addr,
    input r_or_w,                           // for READ, r_or_w = 1 and for WRITE, r_or_w = 0
    input[31:0] write_reg_val,
    output[31:0] read_reg_value
    //output[31:0] write_reg_value
);

    reg[31:0] risc_v_memory_reg[31:0];       // intiialising the RISC-V processor memory with 32 registers each of 32 bits wide

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
                assign read_reg_value = risc_v_memory_reg[register_read_addr];
            end
        
        // upon write operation, the data to be written is written to corresponding register
        else if(r_or_w == 0)
            begin
                assign risc_v_memory_reg[register_write_addr] = reg_write_val;
            end

    
endmodule