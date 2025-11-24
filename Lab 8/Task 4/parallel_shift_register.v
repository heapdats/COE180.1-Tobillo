module parallel_shift_register (
    //Inputs
    input Clk,
    input Shift_in,
    input load,
    input shift_enable,
    input [3:0] parallel_in,
    
    //Outputs
    output wire [3:0] RegContent,
    output wire Shift_out
);

    reg [3:0] shift_reg;

    always @(posedge Clk)
        if(load) begin
            shift_reg <= parallel_in;
        end else if(shift_enable) begin
            shift_reg <= {shift_reg[2:0], Shift_in};
        end
    assign Shift_out = shift_reg[3];
    assign RegContent = shift_reg;
endmodule