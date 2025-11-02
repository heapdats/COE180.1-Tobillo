module or_gate_st (
    input a,
    input b,
    output y
);

    wire not_a, not_b;

    // Use two NAND gates as inverters
    nand_gate_st not_gate_a (
        .a(a),
        .b(a),
        .y(not_a)
    );

    nand_gate_st not_gate_b (
        .a(b),
        .b(b),
        .y(not_b)
    );

    // Use a third NAND gate to combine the inverted inputs
    nand_gate_st nand_final (
        .a(not_a),
        .b(not_b),
        .y(y)
    );

endmodule
