module xnor_gate_st (
    input a,
    input b,
    output y
);

    wire not_a, not_b, nand_out1, nand_out2, xor_out;

    // Invert inputs using a NOR gate
    nor_gate_df nor_inv_a (
        .a(a),
        .b(a),
        .y(not_a)
    );

    nor_gate_df nor_inv_b (
        .a(b),
        .b(b),
        .y(not_b)
    );

    // Use NAND gates to create the terms A and NOT B, and NOT A and B
    nand_gate_df nand1 (
        .a(a),
        .b(not_b),
        .y(nand_out1)
    );

    nand_gate_df nand2 (
        .a(not_a),
        .b(b),
        .y(nand_out2)
    );

    // Use a NAND gate to combine the outputs and form the XOR output
    nand_gate_df xor_comb (
        .a(nand_out1),
        .b(nand_out2),
        .y(xor_out)
    );

    // Invert the final XOR output with a NOT gate to get the XNOR output
    not_gate_df not1 (
        .a(xor_out),
        .y(y)
    );

endmodule
