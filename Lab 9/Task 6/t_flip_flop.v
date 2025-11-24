module T_flip_flop (
    input T,
    input Clk,
    input Reset,
    output reg Q
);
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            Q <= 0;
        else if (T)
            Q <= ~Q;
    end
endmodule
