module left(
    input [3:0] in,       // 4-bit input
    output [3:0] out      // 4-bit output
	 
	);
    // MSB is discarded, LSB gets 0
    assign out[3] = in[2];
    assign out[2] = in[1];
    assign out[1] = in[0];
    assign out[0] = in[3];

endmodule