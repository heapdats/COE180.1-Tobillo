//D Latch
module D_latch_and_ff (input D, input Clk, output reg Qa, output reg Qb, output reg Qc);
    // D Latch
    always @ (D or Clk)
    if(Clk)
    begin
        Qa <= D;
    end

    // Positive-edge D Flip-Flop
    always @ (posedge Clk)
    begin
        Qb <= D;
    end

    // Negative-edge D Flip-Flop
    always @ (negedge Clk)
    begin
        Qc <= D;
    end
endmodule