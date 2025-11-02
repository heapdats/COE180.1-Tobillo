module full_adder_df (
    input logic a, b, c,
    output logic sum, carry
    );
    assign sum = (a ^ b) ^ c;
    assign carry = (a & b) ^ ((a ^ b) & c);
endmodule