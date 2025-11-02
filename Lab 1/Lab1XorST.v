module xor_gate_st (
    input a,
    input b,
    output y
);

    wire not_a, not_b, nand_out1, nand_out2;

    // Use NOR gate as inverter for input a
    nor_gate_df nor_inv_a (
        .a(a),
        .b(a),
        .y(not_a)
    );

    // Use NOR gate as inverter for input b
    nor_gate_df nor_inv_b (
        .a(b),
        .b(b),
        .y(not_b)
    );

    // First NAND gate for a * not b
    nand_gate_df nand1 (
        .a(a),
        .b(not_b),
        .y(nand_out1)
    );

    // Second NAND gate for not a * b
    nand_gate_df nand2 (
        .a(not_a),
        .b(b),
        .y(nand_out2)
    );

    // Combine with a NAND gate to form the final XOR output
    // (a AND not b) OR (not a AND b) becomes NOT((a AND not b) AND (not a AND b))
    // which simplifies to NAND(NAND(a, not b), NAND(not a, b))
    nand_gate_df nand3 (
        .a(nand_out1),
        .b(nand_out2),
        .y(y)
    );

endmodule
