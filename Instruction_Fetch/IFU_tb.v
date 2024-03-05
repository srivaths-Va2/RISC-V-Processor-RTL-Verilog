`timescale 1ns/1ns
`include "IFU.v"

module IFU_tb;
reg clk;
reg reset;
wire[31:0] instruction_word;

IFU ifu(clk, reset, instruction_word);

// Clock generation

initial
    begin
        clk = 1'b0;

        forever begin
            #20 clk = ~clk;
        end
    end

initial
    begin
        $dumpfile("IFU_tb.vcd");
        $dumpvars(0, IFU_tb);

        reset = 1'b1;
        #20;

        reset = 1'b0;
        
        $display("Test complete!");
        #200 $finish;

    end

endmodule