module decoder_4_to_16_bh (
    input [3:0] A, // 4-bit input
    input E, // Enable input
    output reg [15:0] Y // 16-bit output
);
always @(*) begin
    if (E == 1'b1) begin // Decoder enabled
        case (A)
            4'b0000: Y = 16'b0000000000000001;
            4'b0001: Y = 16'b0000000000000010;
            4'b0010: Y = 16'b0000000000000100;
            4'b0011: Y = 16'b0000000000001000;
            4'b0100: Y = 16'b0000000000010000;
            4'b0101: Y = 16'b0000000000100000;
            4'b0110: Y = 16'b0000000001000000;
            4'b0111: Y = 16'b0000000010000000;
            4'b1000: Y = 16'b0000000100000000;
            4'b1001: Y = 16'b0000001000000000;
            4'b1010: Y = 16'b0000010000000000;
            4'b1011: Y = 16'b0000100000000000;
            4'b1100: Y = 16'b0001000000000000;
            4'b1101: Y = 16'b0010000000000000;
            4'b1110: Y = 16'b0100000000000000;
            4'b1111: Y = 16'b1000000000000000;
            default: Y = 16'b0000000000000000; // For completeness, though not strictly necessary here
            endcase
        end else begin // Decoder disabled
            Y = 16'b0000000000000000;
        end
    end
endmodule