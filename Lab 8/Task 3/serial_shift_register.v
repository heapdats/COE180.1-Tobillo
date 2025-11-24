module serial_shift_register (
    input wire Clk,
    input wire Shift_in,
    output wire Shift_out
);

    reg [2:0] shift_reg;

    always @(posedge Clk)
        shift_reg <= {shift_reg[1:0], Shift_in};
    assign Shift_out = shift_reg[2];
endmodule
