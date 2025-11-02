module mux21_df(
    input logic i0, i1, s,
    output logic y
    );
    assign y = (i0 & (~s)) | (i1 & s);
endmodule