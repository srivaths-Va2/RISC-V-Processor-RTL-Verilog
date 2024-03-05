`timescale 1ns / 1ns
`include "array_multiplier.v"

module multiplier_4_x_4_tb;       
  
   reg [3:0]inp1;
   reg [3:0]inp2;       
   wire [7:0]product;  
        
   multiplier_4_x_4 uut(.inp1(inp1),.inp2(inp2),.product(product));

   initial
   begin 

    $dumpfile("multiplier_4_x_4_tb.vcd");
    $dumpvars(0, multiplier_4_x_4_tb);

     inp1=10;
     inp2=12;
     #30 ;

     inp1=13;
     inp2=12;
     #30 ;
   
     inp1=10;
     inp2=22;
     #30 ;
   
     inp1=11;
     inp2=22;
     #30 ;
   
     inp1=12;
     inp2=15;
     #30 ;
   
     $finish;
   end 

endmodule