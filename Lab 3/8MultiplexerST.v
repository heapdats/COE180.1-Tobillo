module mux81_st(
    input  logic i0, i1, i2, i3, i4, i5, i6, i7,
    input  logic [2:0] s,
    output logic y
);
    // Internal wires
    logic s0n, s1n, s2n;       // inverted select signals
    logic y0, y1, y2, y3, y4, y5, y6, y7; // each AND output

    // Invert select lines
    not (s0n, s[0]);
    not (s1n, s[1]);
    not (s2n, s[2]);

    // AND gates for each input combination
    and (y0, s2n, s1n, s0n, i0);  // 000
    and (y1, s2n, s1n, s[0], i1); // 001
    and (y2, s2n, s[1], s0n, i2); // 010
    and (y3, s2n, s[1], s[0], i3); // 011
    and (y4, s[2], s1n, s0n, i4);  // 100
    and (y5, s[2], s1n, s[0], i5); // 101
    and (y6, s[2], s[1], s0n, i6); // 110
    and (y7, s[2], s[1], s[0], i7); // 111

    // OR gate to combine all
    or (y, y0, y1, y2, y3, y4, y5, y6, y7);

endmodule
