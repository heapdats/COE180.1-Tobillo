module full_subtractor_df (
    input logic a, b, c,
    output logic difference, borrow
    );
    assign difference = (a ^ b) ^ c;
    assign borrow = (~(a ^ b) & c) | (~a & b);
endmodule