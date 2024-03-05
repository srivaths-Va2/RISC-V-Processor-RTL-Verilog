/*
verilog module to implement a half adder
*/

module HA (
    output sout,
    output cout,
    input a,
    input b
);

    assign sout = a ^ b;
    assign cout = a & b;
    
endmodule