module half_subtractor_st (
    input logic a, b,
    output logic difference, borrow
    );
    xor difference_gate (difference, a, b);
    and borrow_gate (borrow, ~a, b);
endmodule