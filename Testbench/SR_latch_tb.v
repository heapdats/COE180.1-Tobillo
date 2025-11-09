`timescale 1ns/1ps

module SR_latch_tb;
    reg S, R;
    wire Q, Qbar;

    // SR_latch instance
    SR_latch_df dut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        $dumpfile("SR_latch_tb.vcd");
        $dumpvars(0, SR_latch_tb);

        //Initial state
        S = 0; R = 0; #10;

        S = 1; R = 0; #10;
        S = 0; R = 0; #10;

        S = 0; R = 1; #10;
        S = 0; R = 0; #10;

        S = 1; R = 1; #10;

        S = 0; R = 0; #10;

        $finish;
    end
endmodule