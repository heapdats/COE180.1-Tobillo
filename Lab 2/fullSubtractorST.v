module full_subtractor_st (
    input logic a, b, c,
    output logic difference, borrow
);
    wire temp1, temp2, temp3;
    // Using gate primitives
    xor x1(temp1, a, b);
    xor x2(difference, temp1, c);

    and a1(temp2, ~a, b);
    and a2(temp3, ~temp1, c);
    or  o3(borrow, temp3, temp2);
endmodule