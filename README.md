# Simple RISC-V Processor

The repository is a simple implementation of a RISC-V processor, written in Verilog. 
The processor comprises of multiple components, which include

+ Arithemetic Logic Unit (ALU)
+ Control Unit
+ Datapath Unit
+ Instruction Decoder
+ Instruction Fetch
+ Register files.

# Arithemetic Logic Unit
<p> The ALU takes up two numbers and computes the output of a certain arithemetic or logic operation. The various operations that are supported include-
  
| S.No |  ALU Operation  | alu_ctrl signal |
|:-----|:---------------:|----------------:|
| 1    |    BITWISE AND     |      0000      |
| 2    |    BITWISE OR     |      0001      |
| 3    |    ADD     |      0010      |
| 4    |    SHIFT LEFT    |      0011      |
| 5    |    SUB     |      0100      |
| 6    |    SHIFT RIGHT     |      0101      |
| 7    |    MULTIPLY     |      0110      |
| 8    |    BITWISE XOR     |      0111      |
| 9    |    SET ON LESS THAN      |      1000      |
| 10    |    SHIFT RIGHT ARITHEMETIC     |      1001      |
