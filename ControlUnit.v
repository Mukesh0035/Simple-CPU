module ControlUnit (
    input [7:0] instr,
    output reg [2:0] opcode,
    output reg [1:0] src1,
    output reg [1:0] src2,
    output reg [1:0] dest,
    output reg reg_write,
    output reg alu_src_imm,
    output reg jump,
    output reg halt
);
    always @(*) begin
        opcode = instr[7:5];
        src1 = instr[3:2];
        src2 = instr[1:0];
        dest = instr[3:2];  // destination is always bits 3:2
        reg_write = 0;
        alu_src_imm = 0;
        jump = 0;
        halt = 0;

        case (opcode)
            3'b000: begin // MOV
                reg_write = 1;
                alu_src_imm = 1;  // Use instr[3:0] as immediate
            end
            3'b001: reg_write = 1; // ADD
            3'b010: reg_write = 1; // SUB
            3'b111: halt = 1;      // HLT
            default: begin
                reg_write = 0;
                alu_src_imm = 0;
                halt = 0;
            end
        endcase
    end
endmodule
