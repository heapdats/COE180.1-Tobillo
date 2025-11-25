module thunderbird_wrapper (
    input Clk,
    input Reset,
    input Right,
    input Left,
);
    output wire [1:0] Q_Left;
    output wire [1:0] Q_Right;
    counter left (
        .Clk(Clk),
        .Reset(Reset),
        .Enable(Left),
        .Q(Q_Left)
    );
    counter right (
        .Clk(Clk),
        .Reset(Reset),
        .Enable(Right),
        .Q(Q_Right)
    );
endmodule