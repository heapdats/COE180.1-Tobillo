module T_ff_BH (input T, input Reset, input Clk, output reg Q);
    always @ (posedge Clk or posedge Reset)
    begin 
        if (Reset)
            Q <= 0;
        else
            Q <= Q ^ T;
    end
endmodule