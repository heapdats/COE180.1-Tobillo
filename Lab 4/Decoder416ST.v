// 2-to-4 Decoder
module decoder_2_to_4_st (
    input A1, A0, E,
    output Y3, Y2, Y1, Y0
);
    wire not_A1, not_A0;

    not (not_A1, A1);
    not (not_A0, A0);

    and (Y0, not_A1, not_A0, E);
    and (Y1, not_A1, A0, E);
    and (Y2, A1, not_A0, E);
    and (Y3, A1, A0, E);
endmodule

// 4-to-16 Decoder
module decoder_4_to_16_st (
    input  [3:0] A,
    input        E,
    output [15:0] Y
);
    wire E0, E1, E2, E3; // Enables from top-level 2-to-4 decoder

    // Higher 2 bits control enables for sub-decoders
    decoder_2_to_4_st dec_high (
        .A1(A[3]),
        .A0(A[2]),
        .E(E),
        .Y3(E3),
        .Y2(E2),
        .Y1(E1),
        .Y0(E0)
    );

    // Lower 2 bits decoded under each enable line
    decoder_2_to_4_st dec0 (A[1], A[0], E0, Y[3],  Y[2],  Y[1],  Y[0]);
    decoder_2_to_4_st dec1 (A[1], A[0], E1, Y[7],  Y[6],  Y[5],  Y[4]);
    decoder_2_to_4_st dec2 (A[1], A[0], E2, Y[11], Y[10], Y[9],  Y[8]);
    decoder_2_to_4_st dec3 (A[1], A[0], E3, Y[15], Y[14], Y[13], Y[12]);
endmodule
