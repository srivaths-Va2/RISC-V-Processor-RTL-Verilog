`include "DATAPATH.v"

module DATAPATH_tb;
reg clk;
reg reset;
reg[4:0] mem_read_addr_1;
reg[4:0] mem_read_addr_2;
reg[4:0] mem_write_addr;
reg[3:0] alu_ctrl;
reg r_or_w;
wire zero_flag;

DATAPATH datapath(clk, reset, mem_read_addr_1, mem_read_addr_2, mem_write_addr, alu_ctrl, r_or_w, zero_flag);

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
  mem_read_addr_1 = 5'b0;
  mem_read_addr_2 = 5'b0;
  mem_write_addr = 5'b0;
  alu_ctrl = 4'b0;
  r_or_w = 1'b0;
end

// Test cases and VCD file dump
initial
begin
  $dumpfile("DATAPATH_tb.vcd");
  $dumpvars(0, DATAPATH_tb);

  reset = 1;
  #20;

  reset = 0; mem_read_addr_1 = 5'b00000; mem_read_addr_2 = 5'b00000; mem_write_addr = 5'b00100; alu_ctrl = 4'b0000; r_or_w = 1'b0; write_reg_val = 32'b010010;
  #20;

  reset = 0; register_read_addr_1 = 5'b00000; register_read_addr_2 = 5'b00000; register_write_addr = 5'b10100; r_or_w = 1'b0; write_reg_val = 32'b10;
  #20;

  reset = 0; register_read_addr_1 = 5'b00000; register_read_addr_2 = 5'b00000; register_write_addr = 5'b00101; r_or_w = 1'b0; write_reg_val = 32'b001010;
  #20;

  reset = 0; register_read_addr_1 = 5'b00101; register_read_addr_2 = 5'b10100; register_write_addr = 5'b00000; r_or_w = 1'b1; write_reg_val = 32'b0;
  #20;

  $display("Test Complete!");
  $finish;

end

endmodule 