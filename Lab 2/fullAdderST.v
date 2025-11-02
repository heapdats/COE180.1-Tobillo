module full_adder_st (
    input logic a, b, c
    output logic sum, carry
    );
    wire temp1, temp2, temp3;
    // Using gate primitives
    xor x1(temp1, a, b);
    xor x2(sum, temp1, c);

    and a1(temp2, a, b);
    and a2(temp3, temp1, c);
    xor x3(carry, temp3, temp2);
endmodule