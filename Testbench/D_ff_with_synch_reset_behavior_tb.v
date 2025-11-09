`timescale 1ns/1ps

module D_ff_with_synch_reset_tb;

    // Inputs
    reg D;
    reg Clk;
    reg reset;

    // Output
    wire Q;

    // Instantiate the D flip-flop with synchronous reset
    D_ff_with_synch_reset_behavior dut (
        .D(D),
        .Clk(Clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation (10 ns period)
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk;  // 10 ns period
    end

    // Stimulus
    initial begin

        $dumpfile("D_ff_with_synch_reset_behavior_tb.vcd");
        $dumpvars(0, D_ff_with_synch_reset_tb);
        // Initialize
        D = 0; reset = 0; #20;
        D = 1; reset = 0; #15;
        reset = 1; #5;
        //40 ns
        reset = 0; #5;
        reset = 1; #10;
        reset = 0; #29;
        D = 0; #3;
        reset = 1; #4;
        reset = 0; #5;

        $finish;
    end
endmodule
