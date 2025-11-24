module down_counter(
    input Clk,
    input load,
    input enable,
    input clear,
    output reg [3:0] Q
);
    wire cnt_done;

    assign cnt_done = ~| Q;

    always @(posedge Clk) begin
        if (clear)
            Q <= 0;
        else if (enable)
            if (load | cnt_done)
                Q <= 4'b1010; // decimal 10
            else
                Q <= Q - 1;
    end
endmodule