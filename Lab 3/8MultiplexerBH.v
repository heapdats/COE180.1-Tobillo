module mux81_bh(
    input logic i0, i1, i2, i3, i4, i5, i6, i7,
    input  logic [2:0] s,
    output logic y
    );
    always_comb
    begin
    if (s == 3'b000)
        y = i0;
    else if (s == 3'b001)
        y = i1;
    else if (s == 3'b010)
        y = i2;
    else if (s == 3'b011)
        y = i3;
    else if (s == 3'b100)
        y = i4;
    else if (s == 3'b101)
        y = i5;
    else if (s == 3'b110)
        y = i6;
    else
        y = i7;
    end
endmodule