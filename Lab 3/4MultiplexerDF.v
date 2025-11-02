module mux41_df(
    input  logic i0, i1, i2, i3,
    input  logic [1:0] s,
    output logic y
);
    assign y = (~s[1] & ~s[0] & i0) |
               (~s[1] &  s[0] & i1) |
               ( s[1] & ~s[0] & i2) |
               ( s[1] &  s[0] & i3);
endmodule
