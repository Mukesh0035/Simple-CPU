`timescale 1ns / 1ps

module cpu_tb;
    reg clk = 0;
    reg reset = 1;
    wire [3:0] R0, R1, R2, R3, pc;
    wire [7:0] instr;
    wire halt;

    Simple4BitCPU uut (
        .clk(clk),
        .reset(reset),
        .R0(R0), .R1(R1), .R2(R2), .R3(R3),
        .pc(pc),
        .instr(instr),
        .halt(halt)
    );

    // Clock generation
    always #5 clk = ~clk;

    integer cycle = 0;

    initial begin
        $dumpfile("cpu_wave.vcd");
        $dumpvars(0, cpu_tb);

        #10 reset = 0;

        repeat (20) begin
            @(posedge clk);
            cycle = cycle + 1;

            $display("Cycle %0d | R0=%0d R1=%0d R2=%0d R3=%0d | PC=%0d | Instr=%b",
                cycle, R0, R1, R2, R3, pc, instr);

            if (halt) begin
                $display("CPU Halted at cycle %0d", cycle);
                $finish;
            end
        end

        $display("Simulation ended without halt.");
        $finish;
    end
endmodule
