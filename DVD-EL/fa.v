/*
module to implement the full adder
*/

module FA (
    output sout,
    output cout,
    input a,
    input b,
    input cin
);

    assign sout = (a ^ b ^ cin);
    assign cout = ((a & b) | (b & cin) | (a & cin) );
    
endmodule