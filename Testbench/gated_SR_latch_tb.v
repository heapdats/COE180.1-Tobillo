`timescale 1ns/1ps
module gated_SR_latch_tb;
    reg S, R, E;
    wire Q, Qbar;

    gated_SR_latch_df dut(S, R, E, Q, Qbar);

    initial begin
        $dumpfile("gated_SR_latch_tb.vcd");
        $dumpvars(0, gated_SR_latch_tb);

        // Initial values
        R = 0; S = 0; E = 0; #10;
        R = 0; S = 1; E = 0; #10;
        R = 0; S = 1; E = 1; #10;
        R = 0; S = 0; E = 1; #10;
        R = 1; S = 0; E = 1; #10;
        R = 1; S = 0; E = 0; #10;
        R = 0; S = 1; E = 0; #10;
        R = 1; S = 0; E = 0; #10;
        R = 0; S = 1; E = 0; #10;
        R = 0; S = 1; E = 1; #10;

        $finish;
    end
endmodule
