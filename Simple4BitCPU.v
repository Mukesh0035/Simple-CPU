module Simple4BitCPU (
    input clk,
    input reset,
    output [3:0] R0, R1, R2, R3,
    output [3:0] pc,
    output [7:0] instr,
    output halt
);
    wire [2:0] opcode;
    wire [1:0] src1, src2, dest;
    wire reg_write, alu_src_imm, jump;
    wire [3:0] reg_data1, reg_data2, operandB, alu_result;
    wire zero;

    ProgramCounter PC (
        .clk(clk),
        .reset(reset),
        .new_pc(instr[3:0]),
        .jump(jump),
        .pc(pc)
    );

    InstructionMemory IM (
        .address(pc),
        .instruction(instr)
    );

    ControlUnit CU (
        .instr(instr),
        .opcode(opcode),
        .src1(src1),
        .src2(src2),
        .dest(dest),
        .reg_write(reg_write),
        .alu_src_imm(alu_src_imm),
        .jump(jump),
        .halt(halt)
    );

    RegisterFile RF (
        .clk(clk),
        .we(reg_write),
        .waddr(dest),
        .wdata(alu_result),
        .raddr1(src1),
        .raddr2(src2),
        .rdata1(reg_data1),
        .rdata2(reg_data2),
        .R0(R0),
        .R1(R1),
        .R2(R2),
        .R3(R3)
    );

    assign operandB = alu_src_imm ? instr[3:0] : reg_data2;

    ALU ALU1 (
        .A(reg_data1),
        .B(operandB),
        .opcode(opcode),
        .result(alu_result),
        .zero(zero)
    );
endmodule