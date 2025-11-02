module decoder_3_to_8_st (
    input  [2:0] A,   // 3-bit input
    input        E,   // Enable input
    output [7:0] Y    // 8-bit output
);
    // Internal signals for inverted inputs
    wire nA2, nA1, nA0;

    // NOT gates
    not (nA2, A[2]);
    not (nA1, A[1]);
    not (nA0, A[0]);

    // AND gates for each output line
    and (Y[0], E, nA2, nA1, nA0); // 000
    and (Y[1], E, nA2, nA1, A[0]); // 001
    and (Y[2], E, nA2, A[1], nA0); // 010
    and (Y[3], E, nA2, A[1], A[0]); // 011
    and (Y[4], E, A[2], nA1, nA0); // 100
    and (Y[5], E, A[2], nA1, A[0]); // 101
    and (Y[6], E, A[2], A[1], nA0); // 110
    and (Y[7], E, A[2], A[1], A[0]); // 111

endmodule
