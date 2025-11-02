module full_subtractor_bh (
    input logic a, b, c,
    output logic difference, borrow
    );
    always_comb begin
    difference = (a ^ b) ^ c;
    borrow = (~(a ^ b) & c) | (~a & b);
    end
endmodule