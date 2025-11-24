module counter(
    input Clk,
    input Reset,
    input Enable,
    output wire [7:0] Q
);
    wire [7:0] temp;
    assign temp[0] = Enable;
    assign temp[1] = Enable & Q[0];
    assign temp[2] = Enable & Q[0] & Q[1];
    assign temp[3] = Enable & Q[0] & Q[1] & Q[2];
    assign temp[4] = Enable & Q[0] & Q[1] & Q[2] & Q[3];
    assign temp[5] = Enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
    assign temp[6] = Enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5];
    assign temp[7] = Enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6];

    T_ff_BH bit0(
        .T(temp[0]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[0])
    );
    T_ff_BH bit1(
        .T(temp[1]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[1])
    );
    T_ff_BH bit2(
        .T(temp[2]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[2])
    );
    T_ff_BH bit3(
        .T(temp[3]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[3])
    );
    T_ff_BH bit4(
        .T(temp[4]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[4])
    );
    T_ff_BH bit5(
        .T(temp[5]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[5])
    );
    T_ff_BH bit6(
        .T(temp[6]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[6])
    );
    T_ff_BH bit7(
        .T(temp[7]),
        .Clk(Clk),
        .Reset(Reset),
        .Q(Q[7])
    );
endmodule