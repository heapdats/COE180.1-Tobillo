module mux21_bh(
    input logic i0, i1, s,
    output logic y
    );
    always_comb
    begin
    if (s == 1'b0)
        y = i0;
    else
        y = i1;
    end
endmodule