module nor_gate_st (
    input a,
    input b,
    output y
);

    wire or_out;

    // Instantiate the OR gate
    or_gate_df or1 (
        .a(a),
        .b(b),
        .y(or_out)
    );

    // Instantiate the NOT gate
    not_gate_df not1 (
        .a(or_out),
        .y(y)
    );

endmodule
