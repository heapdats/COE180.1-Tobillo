module decoder_3_to_8_df (
    input  [2:0] A,   // 3-bit input
    input        E,   // Enable input
    output [7:0] Y    // 8-bit output
);

    assign Y[0] = E & ~A[2] & ~A[1] & ~A[0];
    assign Y[1] = E & ~A[2] & ~A[1] &  A[0];
    assign Y[2] = E & ~A[2] &  A[1] & ~A[0];
    assign Y[3] = E & ~A[2] &  A[1] &  A[0];
    assign Y[4] = E &  A[2] & ~A[1] & ~A[0];
    assign Y[5] = E &  A[2] & ~A[1] &  A[0];
    assign Y[6] = E &  A[2] &  A[1] & ~A[0];
    assign Y[7] = E &  A[2] &  A[1] &  A[0];

endmodule
