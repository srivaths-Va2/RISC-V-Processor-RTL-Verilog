`timescale 1ns/1ns
`include "REGISTER.v"

module REGISTER_tb;
reg clk;
reg reset;
reg[4:0] register_read_addr;
reg[4:0] register_write_addr;
reg r_or_w;
reg[31:0] write_reg_val;
wire[31:0] read_reg_value;

REGISTER register(clk, reset, register_read_addr, register_write_addr, r_or_w, write_reg_val, read_reg_value);

// block to intialise and run the clock
initial
begin
  clk = 1'b0;

  forever begin
    #10 clk = ~clk;
  end
end

// Initialising other variables defined reg
initial
begin
  reset = 1'b0;
  register_read_addr = 5'b0;
  register_write_addr = 5'b0;
  r_or_w = 1'b0;
  write_reg_val = 32'b0;

end

initial
begin
  $dumpfile("REGISTER_tb.vcd");
  $dumpvars(0, REGISTER_tb);

  reset = 1;
  #20;

  reset = 0; register_read_addr = 5'b00000; register_write_addr = 5'b00100; r_or_w = 1'b0; write_reg_val = 32'b010010;
  #20;

  reset = 0; register_read_addr = 5'b00000; register_write_addr = 5'b10100; r_or_w = 1'b0; write_reg_val = 32'b10;
  #20;

  reset = 0; register_read_addr = 5'b00000; register_write_addr = 5'b00101; r_or_w = 1'b0; write_reg_val = 32'b001010;
  #20;

  reset = 0; register_read_addr = 5'b00101; register_write_addr = 5'b00000; r_or_w = 1'b1; write_reg_val = 32'b0;
  #20;

  $display("Test Complete!");
  $finish;

end

endmodule 