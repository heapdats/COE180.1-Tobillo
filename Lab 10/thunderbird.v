module thunderbird_wrapper (
    input Clk,
    input Reset,
    input Right_switch,
    input Left_switch,

    output L_A,
    output L_B,
    output L_C,
    output R_A,
    output R_B,
    output R_C
);
    wire [1:0] Q_Left;
    wire [1:0] Q_Right;
    wire Clk_div;
    
    counter left (
        .Clk(Clk),
        .Reset(Reset),
        .Enable(Left),
        .Q(Q_Left)
    );
    counter right (
        .Clk(Clk),
        .Reset(Left_switch),
        .Enable(Right_switch),
        .Q(Q_Right)
    );
endmodule