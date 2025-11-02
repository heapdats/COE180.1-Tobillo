module mux21_st(
    input logic i0, i1, s,
    output logic y
    );
    logic net1, net2, net3;
// Use gate modules from previous labs
    not_gate g1(net1, s); // net1 = ~s
    and_gate g2(net2, i1, s); // net2 = i1 & s
    and_gate g3(net3, i0, net1); // net3 = i0 & ~s
    or_gate g4(y, net3, net2); // y = net3 | net2
endmodule