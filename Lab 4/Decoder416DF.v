module decoder_4_to_16_df (
    input  logic [3:0] A,   // 4-bit input
    input  logic E,         // Enable input
    output logic [15:0] Y   // 16-bit output
);
    // When enabled, shift a 1 by A positions
    assign Y = (E) ? (16'b0000_0000_0000_0001 << A) : 16'b0;
endmodule
