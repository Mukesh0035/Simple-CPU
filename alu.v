module ALU(
    input [3:0] A,
    input [3:0] B,
    input [2:0] opcode,
    output reg [3:0] result,
    output zero
);
    always @(*) begin
        case (opcode)
            3'b000: result = B;        // MOV (use B as immediate)
            3'b001: result = A + B;    // ADD
            3'b010: result = A - B;    // SUB
            default: result = 4'b0000;
        endcase
    end
    assign zero = (result == 4'b0000);
endmodule