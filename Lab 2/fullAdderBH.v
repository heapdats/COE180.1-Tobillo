module full_adder_bh (
    input logic a, b, c,
    output logic sum, carry
    );
    always_comb begin
    sum = (a ^ b) ^ c;
    carry =(a & b) ^ ((a ^ b) & c);
    end
endmodule