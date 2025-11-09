`timescale 1ns/1ps

module D_ff_tb;

    // Inputs
    reg D;
    reg Clk;

    // Outputs
    wire Q;

    // Instantiate the D flip-flop
    D_ff_BH uut (
        .D(D),
        .Clk(Clk),
        .Q(Q)
    );

    // Clock generation: 10ns period
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk; // Toggle every 10ns
    end

    // Test stimulus
    initial begin
        $dumpfile("D_ff_tb.vcd");
        $dumpvars(0, D_ff_tb);

        D = 0; #30;
        D = 1 ;#30;
        D = 0; #40;
        D = 1; #20;
        D = 0; #30;
        $finish; // End simulation
    end
endmodule
