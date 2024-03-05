`timescale 1ns/1ns
`include "ha.v"

module ha_tb;
wire sout;
wire cout;
reg a;
reg b;

HA half_adder(sout, cout, a, b);

initial begin
    $dumpfile("ha_tb.vcd");
    $dumpvars(0, ha_tb);

    a = 1'b0; b = 1'b0;
    #20;

    a = 1'b0; b = 1'b1;
    #20;

    a = 1'b1; b = 1'b0;
    #20;

    a = 1'b1; b = 1'b1;
    #20;

    $display("Test complete!");
    $finish;
end

endmodule;