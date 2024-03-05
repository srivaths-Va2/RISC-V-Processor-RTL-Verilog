`timescale 1ns/1ns
`include "fa.v"

module fa_tb;
wire sout;
wire cout;
reg a;
reg b;
reg cin;

FA full_adder(sout, cout, a, b, cin);

initial begin
    $dumpfile("fa_tb.vcd");
    $dumpvars(0, fa_tb);

    a = 1'b0; b = 1'b0; cin = 1'b0;
    #20;

    a = 1'b0; b = 1'b0; cin = 1'b1;
    #20;

    a = 1'b0; b = 1'b1; cin = 1'b0;
    #20;

    a = 1'b0; b = 1'b1; cin = 1'b1;
    #20;

    a = 1'b1; b = 1'b0; cin = 1'b0;
    #20;

    a = 1'b1; b = 1'b0; cin = 1'b1;
    #20;

    a = 1'b1; b = 1'b1; cin = 1'b0;
    #20;

    a = 1'b1; b = 1'b1; cin = 1'b1;
    #20;

    $display("Test complete!");
    $finish;
end

endmodule;