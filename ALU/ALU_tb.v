`timescale 1ns/1ns
`include "ALU.v"

module ALU_tb;

reg[7:0] in1, in2;
reg[3:0] alu_ctrl;
wire[7:0] alu_result;
wire zero_flag;

ALU alu(in1, in2, alu_ctrl, alu_result, zero_flag);

initial begin
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, ALU_tb);

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0000;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0001;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0010;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0011;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0100;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0101;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0110;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b0111;
    #20;

    in1 = 8'b00000101; in2 = 8'b00000110; alu_ctrl = 4'b1000;
    #20;

    $display("Test complete!");

end

endmodule