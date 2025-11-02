module nand_gate_st (
    input a,
    input b,
    output y
);

    wire and_out;

    // Instantiate an AND gate
    and_gate_df and1 (
        .a(a),
        .b(b),
        .y(and_out)
    );

    // Instantiate a NOT gate to invert the AND output
    not_gate_df not1 (
        .a(and_out),
        .y(y)
    );

endmodule
