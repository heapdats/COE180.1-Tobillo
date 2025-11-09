`timescale 1ns/1ps

module tb_D_latch_and_ff;

    // Inputs
    reg D;
    reg Clk;

    // Outputs
    wire Qa; // D latch
    wire Qb; // Positive-edge D FF
    wire Qc; // Negative-edge D FF

    // Instantiate the combined module
    D_latch_and_ff dut (
        .D(D),
        .Clk(Clk),
        .Qa(Qa),
        .Qb(Qb),
        .Qc(Qc)
    );

    // Clock generation (10 ns period)
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk;  // toggles every 10 ns
    end

    // Stimulus for D
    initial begin
        $dumpfile("D_latch_and_ff_tb.vcd");
        $dumpvars(0, tb_D_latch_and_ff);

        D = 0; #8;  
        D = 1; #4;
        D = 0; #2;
        D = 1; #4; 
        D = 0; #5;
        D = 1; #3; 
        D = 0; #1;
        D = 1; #1;
        D = 0; #6;
        D = 1; #1;
        D = 0; #1;
        D = 1; #5;
        D = 0; #5;
        $finish;
    end
endmodule
