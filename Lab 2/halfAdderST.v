module half_adder_st (
    input logic a, b,
    output logic sum, carry
);
    // Using built-in gate primitives (positional only)
    xor sum_gate   (sum, a, b);
    and carry_gate (carry, a, b);
endmodule
