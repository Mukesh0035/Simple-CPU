module InstructionMemory (
    input [3:0] address,
    output [7:0] instruction
);
    reg [7:0] memory[0:15];
    initial begin
        memory[0] = 8'b00000011; // MOV R0, #3
        memory[1] = 8'b00010101; // MOV R1, #5
        memory[2] = 8'b00101000; // ADD R2 = R0 + R1
        memory[3] = 8'b11100000; // HLT
    end
    assign instruction = memory[address];
endmodule