module and_gate_st (
    input a,
    input b,
    output y
);

    wire not_a, not_b;

    // Invert the inputs
    not_gate_df not_gate_a (
        .a(a),
        .y(not_a)
    );

    not_gate_df not_gate_b (
        .a(b),
        .y(not_b)
    );

    // Pass the inverted inputs through a NOR gate
    nor_gate_df nor1 (
        .a(not_a),
        .b(not_b),
        .y(y)
    );

endmodule
