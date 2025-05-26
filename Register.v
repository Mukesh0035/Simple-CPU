module RegisterFile (
    input clk,
    input we,
    input [1:0] waddr,
    input [3:0] wdata,
    input [1:0] raddr1,
    input [1:0] raddr2,
    output [3:0] rdata1,
    output [3:0] rdata2,
    output [3:0] R0, R1, R2, R3
);
    reg [3:0] regs[3:0];

    always @(posedge clk) begin
        if (we)
            regs[waddr] <= wdata;
    end

    assign rdata1 = regs[raddr1];
    assign rdata2 = regs[raddr2];

    assign R0 = regs[0];
    assign R1 = regs[1];
    assign R2 = regs[2];
    assign R3 = regs[3];
endmodule
