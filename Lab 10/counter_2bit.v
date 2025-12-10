module counter(
    input Clk,
    input Reset,
    input Enable,
    output wire [1:0] Q
);
    wire [1:0] D;
    assign D[0] = Q[0] ^ Enable;
    assign D[1] = Q[1] ^ (Enable & Q[0]);

    D_flip_flop bit0(
        .D(D[0]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[0])
    );
    D_flip_flop bit1(
        .D(D[1]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[1])
    );
endmodule