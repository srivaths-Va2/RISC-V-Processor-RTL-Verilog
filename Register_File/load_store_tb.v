`timescale 1ns/1ns
`include "load_store.v"

module load_store_tb;
reg clk;
reg reset;
reg ld_str;
reg[4:0] register_addr;
reg[31:0] store_val;
wire[31:0] load_val;

LOAD_STORE load_str(clk, reset, ld_str, register_addr, store_val, load_val);

// block to intialise and run the clock
initial
begin
  clk = 1'b0;

  forever begin
    #10 clk = ~clk;
  end
end

initial
    begin
        reset = 1'b0;
        ld_str = 1'b0;
        register_addr = 5'b00000;
    end

initial
    begin
        $dumpfile("load_store_tb.vcd");
        $dumpvars(0, load_store_tb);

        //reset = 1'b1;
        //#20;

        reset = 1'b0; ld_str = 0; register_addr = 5'b00000; store_val = 32'b0010;
        #20;

        reset = 1'b0; ld_str = 0; register_addr = 5'b00100; store_val = 32'b0011;
        #20;

        #10;

        reset = 1'b0; ld_str = 1; register_addr = 5'b00000; store_val = 32'b0000;
        #20;

        reset = 1'b0; ld_str = 1; register_addr = 5'b00100; store_val = 32'b0000;
        #20;

        $display("Test Complete");
        $finish;
    end 

endmodule;