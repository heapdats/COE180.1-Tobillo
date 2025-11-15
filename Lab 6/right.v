module right(
    input [3:0] in,       // 4-bit input
    output [3:0] out      // 4-bit output
);

    // LSB is discarded, MSB gets 0
    assign out[3] = in[0];
    assign out[2] = in[3];
    assign out[1] = in[2];
    assign out[0] = in[1];

endmodule
