module Register_load_reset_enable (
    input Clk,
    input load,
    input reset,
    input [3:0] data_in,
    output reg [3:0] data_out
);
    always @(posedge Clk)
    if (reset) begin
        data_out <= 4'b0;
    end else if (load) begin
        data_out <= data_in;
    end 
endmodule

