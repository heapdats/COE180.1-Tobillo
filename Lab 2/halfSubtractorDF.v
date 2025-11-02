module half_subtractor_df (
    input logic a, b,
    output logic difference, borrow
    );
    assign difference = a ^ b;
    assign borrow = ~a & b;
endmodule