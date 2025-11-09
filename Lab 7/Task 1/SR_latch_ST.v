`timescale 1ns/1ps
module SR_latch_st (input R, input S, output Q, output Qbar);
    nor (Q, R, Qbar);
    nor (Qbar, S, Q);
endmodule