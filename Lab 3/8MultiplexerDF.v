module mux81_df(
    input  logic i0, i1, i2, i3, i4, i5, i6, i7,
    input  logic [2:0] s,
    output logic y
);
    assign y = (i0 & ~s[0] & ~s[1] & ~s[2]) |
               (i1 &  s[0] & ~s[1] & ~s[2]) |
               (i2 & ~s[0] &  s[1] & ~s[2]) |
               (i3 &  s[0] &  s[1] & ~s[2]) |
               (i4 & ~s[0] & ~s[1] &  s[2]) |
               (i5 &  s[0] & ~s[1] &  s[2]) |
               (i6 & ~s[0] &  s[1] &  s[2]) |
               (i7 &  s[0] &  s[1] &  s[2]);
endmodule
