`timescale 1ns/1ps

module D_latch_tb;
    reg D, Enable;
    wire Q, Qbar;

    D_latch_BH dut(
        .D(D),
        .Enable(Enable),
        .Q(Q),
        .Qbar(Qbar)
    );


    //
    initial begin
        $dumpfile("D_latch_tb.vcd");
        $dumpvars(0, D_latch_tb);

        // Initial State
        D = 0; Enable = 0; #10;
        D = 1; Enable = 0; #10;
        D = 1; Enable = 1; #10;
        D = 0; Enable = 1; #10;
        D = 1; Enable = 1; #10;
        D = 1; Enable = 0; #10;
        D = 0; Enable = 0; #10;
        D = 1; Enable = 0; #10;
        D = 0; Enable = 0; #10;
        D = 0; Enable = 1; #10;
        D = 1; Enable = 1; #10;
        D = 0; Enable = 1; #100;

    end
endmodule
