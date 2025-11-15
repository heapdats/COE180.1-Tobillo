module alu2 (
    input  [1:0] A,    // 2-bit operand A
    input  [1:0] B,    // 2-bit operand B
    input  [2:0] S,    // Operation select (00=AND, 01=OR, 10=ADD, 11=SUB)
    input  Cin,         // Initial carry-in

    output [1:0] R,    // 2-bit result
    output Cout,        // Carry out of MSB
    output c0           // Internal carry from LSB
);

    wire Binvert;

    // Only invert B for SUB (S=011)
    assign Binvert = (S == 3'b011);

    // Bit 0 (LSB)
    alu1 bit0 (
        .A(A[0]),
        .B(B[0]),
        .Binvert(Binvert),
        .Cin(Cin),
        .S(S[1:0]),
        .R(R[0]),
        .Cout(c0)
    );

    // Bit 1 (MSB)
    alu1 bit1 (
        .A(A[1]),
        .B(B[1]),
        .Binvert(Binvert),
        .Cin(c0),
        .S(S[1:0]),
        .R(R[1]),
        .Cout(Cout)
    );

endmodule
