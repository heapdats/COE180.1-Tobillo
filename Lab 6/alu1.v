module alu1 (
    input  A,
    input  B,
    input  Binvert,
    input  Cin,
    input  [1:0] S,   // Operation select
    output R,
    output Cout
);

    // Internal wires
    wire Bx;            
    wire and_out, or_out;
    wire sum, xor1;
    wire and1, and2, and3;
    wire Cout_raw;

    // Invert B 1s comp  
    xor g0(Bx, B, Binvert);

    // AND & OR
    and g1(and_out, A, Bx);
    or  g2(or_out,  A, Bx);

    // Full Adder for ADD/SUB
    xor g3(xor1, A, Bx);
    xor g4(sum, xor1, Cin);
    and g5(and1, A, Bx);
    and g6(and2, A, Cin);
    and g7(and3, Bx, Cin);
    or  g8(Cout_raw, and1, and2, and3);


    // Cout to only ADD/SUB

    wire S_add_sub;
    or u_add_sub(S_add_sub, S[1] & ~S[0], S[1] & S[0]);  // S=10 (ADD) or S=11 (SUB)
    and gCout(Cout, Cout_raw, S_add_sub);                 // Cout valid only for ADD/SUB

    // Mux to select output R
    wire S0_bar, S1_bar;
    wire s_and, s_or, s_add, s_sub;

    not n1(S0_bar, S[0]);
    not n2(S1_bar, S[1]);

    and m1(s_and, and_out, S1_bar, S0_bar);  // AND  S=00
    and m2(s_or,  or_out,  S1_bar, S[0]);    // OR   S=01
    and m3(s_add, sum,     S[1], S0_bar);    // ADD  S=10
    and m4(s_sub, sum,     S[1], S[0]);      // SUB  S=11

    or  m5(R, s_and, s_or, s_add, s_sub);

endmodule
