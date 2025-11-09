module D_ff_BH (input D, input Clk, output reg Q);
    always @ (posedge Clk)
    begin
        Q <= D;
    end
endmodule