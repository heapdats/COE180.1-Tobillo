module T_ff (
    input T,
    input Clk,
    input Reset,
    output reg Q
);
    always @(posedge Clk) begin
        if (Reset)
            Q <= 0;
        else if (T)
            Q <= ~Q;
    end
endmodule
