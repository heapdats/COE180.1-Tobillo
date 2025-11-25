module counter(
    input Clk,
    input Reset,
    input Enable,
    output wire [1:0] Q
);
    wire [1:0] temp;
    assign temp[0] = Enable;
    assign temp[1] = Enable & Q[0];

    T_flip_flop bit0(
        .T(temp[0]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[0])
    );
    T_flip_flop bit1(
        .T(temp[1]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[1])
    );
endmodule