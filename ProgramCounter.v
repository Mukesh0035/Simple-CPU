module ProgramCounter (
    input clk,
    input reset,
    input [3:0] new_pc,
    input jump,
    output reg [3:0] pc
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 0;
        else if (jump)
            pc <= new_pc;
        else
            pc <= pc + 1;
    end
endmodule