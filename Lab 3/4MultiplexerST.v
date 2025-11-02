module mux41_st (
    input  logic i0, i1, i2, i3,
    input  logic s1, s2,
    output logic y
);
    logic ns2, ns1;
    logic t0, t1, t2, t3;

    // Inverters
    not (ns2, s2);
    not (ns1, s1);

    // AND gates for each input selection
    and (t0, ns2, ns1, i0);
    and (t1, ns2, s1,  i1);
    and (t2, s2,  ns1, i2);
    and (t3, s2,  s1,  i3);

    // OR gate to combine
    or  (y, t0, t1, t2, t3);

endmodule
