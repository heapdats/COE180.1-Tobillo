module half_adder_df (
    input logic a, b,
    output logic sum, carry
    );
    assign sum = a ^ b;
    assign carry = a & b;
endmodule