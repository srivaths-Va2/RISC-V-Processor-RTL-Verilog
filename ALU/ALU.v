/*

The module implements the ALU for the processor.
The ALU comprises of the following function table

    Function        |       alu_ctrl
    BITWISE AND             0000
    BITWISE OR              0001
    ADD                     0010
    SHIFT LEFT              0011
    SUB                     0100
    SHIFT RIGHT             0101
    MULTIPLY                0110
    BITWISE XOR             0111
    SET ON LESS THAN        1000

*/

module ALU (
    input[7:0] in1, in2,
    input[3:0] alu_ctrl,
    output reg[7:0] alu_result,
    output reg zero_flag

);

    always@(*)
        begin
            case (alu_ctrl)
                4'b0000 : alu_result = in1 & in2;
                4'b0001 : alu_result = in1 | in2;
                4'b0010 : alu_result = in1 + in2;
                4'b0011 : alu_result = in1 << in2;
                4'b0100 : alu_result = in1 - in2;
                4'b0101 : alu_result = in1 >> in2;
                4'b0110 : alu_result = in1 * in2;
                4'b0111 : alu_result = in1 ^ in2;
                4'b1000 : begin
                    if(in1 < in2)
                        alu_result = 1;
                    else
                        alu_result = 0;
                end 
            endcase

        if(alu_result == 0)
            assign zero_flag = 1'b1;
        else
            assign zero_flag = 1'b0;

        end




endmodule