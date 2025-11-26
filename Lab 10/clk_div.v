module clk_div(
    input clk,
    input reset,
    output clk_en
);
    reg [3:0] clk_count;
    always @(posedge clk)
    begin
        if(reset)
            clk_count <= 0;
        else
            clk_count <=clk_count + 1;
    end
    assign clk_en = &clk_count;
endmodule