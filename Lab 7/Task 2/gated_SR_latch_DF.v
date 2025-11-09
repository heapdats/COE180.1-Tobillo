`timescale 1ns/1ps
module gated_SR_latch_df (input R, input S, input E, output Q, output Qbar);
    assign #2 Q_i = Q;
    assign #2 Qbar_i = Qbar;

    assign #2 S_on = S & E;
    assign #2 R_on = R & E; 

    assign #2 Qbar = ~ (R_on | Q);
    assign #2 Q = ~ (S_on | Qbar);
endmodule