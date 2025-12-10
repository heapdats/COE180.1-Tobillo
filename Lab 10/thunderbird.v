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

    
    clk_div div(
        .clk(Clk),
        .reset(Reset),
        .clk_en(Clk_div)
    );

    counter left (
        .Clk(Clk),
        .Reset(Reset),
        .Enable((Q_Left[0] | Q_Left[1] | Left_switch) & Clk_div),
        .Q(Q_Left)
    );

    counter right (
        .Clk(Clk),
        .Reset(Reset),
        .Enable((Q_Right[0] | Q_Right[1] |Right_switch) & Clk_div),
        .Q(Q_Right)
    );

    assign L_A = (Q_Left[1] | Q_Left[0]);    
    assign L_B = Q_Left[1]; 
    assign L_C = (Q_Left[1] & Q_Left[0]);

    assign R_A = (Q_Right[1] | Q_Right[0]);
    assign R_B = Q_Right[1];
    assign R_C = (Q_Right[1] & Q_Right[0]);
endmodule