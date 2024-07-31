# Simple RISC-V Processor

The repository is a simple implementation of a RISC-V processor, written in Verilog. 
The processor comprises of multiple components, which include

+ Arithemetic Logic Unit (ALU)
+ Control Unit
+ Datapath Unit
+ Instruction Decoder
+ Instruction Fetch
+ Register files.

## Arithemetic Logic Unit
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

## Control Unit
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

The R-type instructions are used for operations that set a destination register rd to the result of an arithmetic, logical or shift operation applied to source registers rs1 and rs2.

The U-Type format is used for instructions that use a 20-bit immediate operand and an rd destination register. The rd field contains an x register number to be set to a value that depends on the instruction.

The J-type instruction format is used to encode the jal instruction with an immediate value that determines the jump target address. It is similar to the U-type, but the bits in the immediate operand are arranged in a different order. 

The I-type instruction format is used to encode instructions with a signed 12-bit immediate operand with a range of [−2048..2047], an rd register, and an rs1 register.

The S-type instruction format is used to encode instructions with a signed 12-bit immediate operand with a range of [−2048..2047], an rs1 register, and an rs2 register.

The B-type instruction format is used for branch instructions that require an even immediate value that is used to determine the branch target address as an offset from the current instruction’s address.

the signal inst_type gives information of the encoding of the instruction. 

| S.No |  Instruction-Type  | Instruction Encoding |
|:-----|:------------------:|---------------------:|
| 1 | 3'b000 | R |
| 2 | 3'b001 | U |
| 3 | 3'b010 | J |
| 4 | 3'b011 | I |
| 5 | 3'b100 | S |
| 6 | 3'b101 | B |

## Datapath Unit
The Datapath unit is the core component of the digital system, that integrates the register files and the Arithmetic and Logic Units (ALU).
It simply takes the addresses of the entries in memory that are to be computed, and uses the alu_ctrl signal to perform the required operation. It also takes an additional R/W input to indicate read from memory and write to memory.

## Instruction Decoder
The instruction decoder comprises of several submodules that decode the instruction code. Depending on the opcode, it classifies the instruction and retrieves the components of the instruction, which include the various operands, operators and other data. The master-decoder module combines these several submodules into one fully functional decoder

## Instruction Fetch
The instruction fetch unit retrieves the instructions from the instruction memory. It also updates the program counter incrementally by 1 unit to point to the next successive instruction.

## Instruction Memory Unit
The instruction memory unit comprises of the instructions to be executed in the near future. This component as of now is static with only 10 registers for testing porposes. Upon full fledged completion of the processor, the memory space of the processor would be increased and a bootloader program could be written in assembly to boot the processor upon startup. The bootloader program is to be stored in the code section of the instruction memory unit, which is to be protected from the user.

## Register File
The module covers the implementation of RISC-V processor internal registers. The ISA specifies 32 registers in the archutecture. The width of each register is 32 bits. Hence, we require 5 bits to address each register.
The module supports both read and write operations on these registers.