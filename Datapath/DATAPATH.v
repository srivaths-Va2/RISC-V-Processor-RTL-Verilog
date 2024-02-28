/*
The module DATAPATH covers the integration of the ALU and the Memory of the processor
Here, the addresses in memory are accessed and then the operation is selected. Hence, we reference the data by memory address selection
*/

`include "./../Register_File/REGISTER.v"
`include "./../ALU/ALU.v"

module DATAPATH (
    input clk,
    input reset,
    input[4:0] mem_read_addr_1,
    input[4:0] mem_read_addr_2,
    input[4:0] mem_write_addr,
    input[3:0] alu_ctrl,
    input r_or_w,
    input[31:0] write_reg_val,
    output zero_flag
);

    // Declaring the intermediate wires carrying data
    wire[31:0] read_val_1;
    wire[31:0] read_val_2;
    //wire[31:0] write_val;
    

    // instantiating the register file
    REGISTER register(clk, reset, mem_read_addr_1, mem_read_addr_2, mem_write_addr, r_or_w, write_reg_val, read_val_1, read_val_2);

    // instantiating the ALU
    ALU alu(read_val_1, read_val_2, alu_ctrl, write_reg_val, zero_flag);

endmodule