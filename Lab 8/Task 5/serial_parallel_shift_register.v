module serial_parallel_shift_register (
    //Inputs
    input Clk,
    input Shift_in, 
    input Shift_enable,
    
    //Outputs
    output wire [3:0] Parallel_out,
    output wire Shift_out
);
    reg [3:0] shift_reg;

    always @(posedge Clk)
        if(Shift_enable) begin
            shift_reg <= {shift_reg[2:0], Shift_in};
        end
    assign Shift_out = shift_reg[3];
    assign Parallel_out = shift_reg;
endmodule