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
| 1 | BITWISE AND | 0000 |
| 2 | BITWISE OR | 0001  |
| 3 | ADD | 0010 |
| 4 | SHIFT LEFT | 0011 |
| 5 | SUB | 0100 |
| 6 | SHIFT RIGHT | 0101 |
| 7 | MULTIPLY | 0110 |
| 8 | BITWISE XOR | 0111 |
| 9 | SET ON LESS THAN | 1000 |
| 10 | SHIFT RIGHT ARITHEMETIC | 1001 |

The alu_ctrl signal is an input signal that directs the ALU to perform a certain operation.
The ALU unit also outputs a zero flag, that sets when the result upon computation is zero

# Control Unit
The module depicts the control unit of the processor. 
The control unit takes in the opcode, funct7 and funct3 as the inputs and determines the control register write in 
the IFU and the ALU control in the ALU for the proper execution of the instruction

The module outputs control instructions for-
+ R-type instructions 
+ U-type instructions 
+ J-type instructions
+ I-type instructions
+ S-type instructions
+ B-type instructions

The R-type instructions are used for operations that set a destination register rd to the result of an arithmetic, logical or shift operation applied to source registers rs1 and rs2. The instructions offered under the U-type instruction set include-
+ add instruction
+ and instruction
+ or instruction
+ sll instruction
+ slt instruction
+ sltu instruction
+ sra instruction
+ srl instruction
+ sub instruction
+ xor instruction

The U-Type format is used for instructions that use a 20-bit immediate operand and an rd destination register. The rd field contains an x register number to be set to a value that depends on the instruction. The instructions offered under the U-type instruction set include-
+ lui instruction
+ auipc instruction

The J-type instruction format is used to encode the jal instruction with an immediate value that determines the jump target address. It is similar to the U-type, but the bits in the immediate operand are arranged in a different order. The instructions offered under the J-type instruction set include-
+ jal instruction

The I-type instruction format is used to encode instructions with a signed 12-bit immediate operand with a range of [−2048..2047], an rd register, and an rs1 register. The instructions offered under the I-type instruction set include-
+ addi instruction
+ andi instruction
+ jalr instruction
+ lb instruction
+ lbu instruction
+ lh instruction
+ lhu instruction
+ lw instruction
+ ori instruction
+ slli instruction
+ slti instruction
+ sltiu instruction
+ srai instruction
+ srli instruction
+ xori instruction

The S-type instruction format is used to encode instructions with a signed 12-bit immediate operand with a range of [−2048..2047], an rs1 register, and an rs2 register. The instructions offered under the S-type instruction set include-
+ sb instruction
+ sh instruction
+ sw instruction

The B-type instruction format is used for branch instructions that require an even immediate value that is used to determine the branch target address as an offset from the current instruction’s address.The instructions offered under the B-type instruction set include-
+ beq instruction
+ bge instruction
+ bgeu instruction
+ blt instruction
+ bltu instruction
+ bne instruction


the signal inst_type gives information of the encoding of the instruction. 

| S.No |  Instruction-Type  | Instruction Encoding |
|:-----|:------------------:|---------------------:|
| 1 | 3'b000 | R |
| 2 | 3'b001 | U |
| 3 | 3'b010 | J |
| 4 | 3'b011 | I |
| 5 | 3'b100 | S |
| 6 | 3'b101 | B |


