`timescale 1ns/1ns
`include "REGISTER.v"

module REGISTER_tb;

  reg clk, reset, r_or_w;
  reg[4:0] register_read_addr, register_write_addr;
  reg[31:0] write_reg_val;
  wire[31:0] read_reg_value;

  REGISTER register(
    .clk(clk),
    .reset(reset),
    .register_read_addr(register_read_addr),
    .register_write_addr(register_write_addr),
    .r_or_w(r_or_w),
    .write_reg_val(write_reg_val),
    .read_reg_value(read_reg_value)
  );

  initial begin
    clk = 0;
    reset = 0;
    register_read_addr = 5'b0;
    register_write_addr = 5'b0;
    r_or_w = 0;
    write_reg_val = 32'h0;

    $dumpfile("REGISTER_tb.vcd");
    $dumpvars(0, REGISTER_tb);

    reset = 1;
    #20;

    reset = 0; register_write_addr = 5'b00100; r_or_w = 0; write_reg_val = 32'h20;
    #20;

    reset = 0; register_write_addr = 5'b10100; r_or_w = 0; write_reg_val = 32'hAB;
    #20;

    reset = 0; register_write_addr = 5'b01100; r_or_w = 0; write_reg_val = 32'h451;
    #20;

    reset = 0; register_read_addr = 5'b00100; r_or_w = 1; 
    #20;

    $display("Test Complete1");
    $finish;
  end

  forever begin
    #10 clk = ~clk;
  end

endmodule
