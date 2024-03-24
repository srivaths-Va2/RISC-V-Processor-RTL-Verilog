`include "DATAPATH_v2.v"

module DATAPATH_v2_tb;
reg[6:0] imm_B_MSB;
reg[4:0] imm_B_LSB;
reg[11:0] imm_I;
reg[19:0] imm_J;
reg[6:0] imm_S_MSB;
reg[4:0] imm_S_LSB;
reg[19:0] imm_U;
reg[4:0] rd;
reg[4:0] rs2;
reg[4:0] rs1;

// defining the control signals from CONTROL
reg[3:0] alu_ctrl;
reg shamt_en;        // control strobe for shift amount for I-type instructions
reg[2:0] branch_ctrl; 
reg jump_ctrl;       // control strobe to indicate JUMP instruction
reg reg_write;
reg[2:0] inst_type;

DATAPATH_v2 datapath(imm_B_MSB, imm_B_LSB, imm_I, imm_J, imm_S_MSB, imm_S_LSB, imm_U, rd, rs2, rs1, alu_ctrl, shamt_en, branch_ctrl, jump_ctrl, reg_write, inst_type);

// block to intialise and run the clock
initial
begin
  clk = 1'b0;

  forever begin
    #10 clk = ~clk;
  end
end

// Initialising the variables to reset
initial begin
    imm_B_MSB = 7'b0;
    imm_B_LSB = 5'b0;
    imm_I = 12'b0;
    imm_J = 20'b0;
    imm_S_MSB = 7'b0;
    imm_S_LSB = 5'b0;
    imm_U = 20'b0;
    rd = 5'b0;
    rs1 = 5'b0;
    rs2 = 5'b0;
    alu_ctrl = 4'b0000;
    shamt_en = 1'b0;        
    branch_ctrl = 3'b000; 
    jump_ctrl = 1'b0;       
    reg_write = 1'b0;
    inst_type = 3'b000;
end

// Test cases and VCD file dump
initial
begin
  $dumpfile("DATAPATH_v2_tb.vcd");
  $dumpvars(0, DATAPATH_v2_tb);

  rs1 = 5'b00000; rs2 = 5'b00001; rd = 5'b00101; alu_ctrl = 4'b0000;
  #20;

  rs1 = 5'b00010; rs2 = 5'b00011; rd = 5'b00110; alu_ctrl = 4'b0001;
  #20;

  rs1 = 5'b00100; rs2 = 5'b00101; rd = 5'b00100; alu_ctrl = 4'b0010;
  #20;

  $display("Test Complete!");
  $finish;

end

endmodule

