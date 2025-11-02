module half_subtractor_bh (
    input logic a, b,
    output logic difference, borrow
    );
    always_comb begin
    difference = a ^ b;
    borrow = ~a & b;
    end
endmodule