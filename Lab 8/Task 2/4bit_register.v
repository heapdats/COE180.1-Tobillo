module Register_load__set_reset_enable (
    input Clk,
    input load,
    input reset,
    input set,
    input [3:0] data_in,
    output reg [3:0] data_out
);
    always @(posedge Clk)
    if (reset) begin
        data_out <= 4'b0;
    end else if (set) begin
        data_out <= 4'b1111;
    end else if (load) begin
        data_out <= data_in;
    end 
endmodule

