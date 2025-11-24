`timescale 1ns/1ps

module register_4bit_tb;

    //input
    reg load;
    reg reset;
    reg [3:0] data_in;
    reg Clk;

    //output
    wire [3:0] data_out;

    // Module
    Register_load_reset_enable dut (
        .Clk(Clk),
        .load(load),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation (10 ns period)
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk;  // 10 ns period
    end

    // Stimulus
    initial begin
        $dumpfile("register_4bit_tb.vcd");
        $dumpvars(0, register_4bit_tb);

        // Initialize
        load = 0; reset = 0; data_in = 4'b0000; #20;
        data_in = 4'b0101; #40;
        load = 1; #20;
        data_in = 4'b1001;
        load = 0; #40;
        load = 1; #20;
        load = 0; #15;
        reset = 1; #40;
        load = 1; #20;
        load = 0; #25;
        reset = 0; #40;
        load = 1; #20;
        $finish;
    end
endmodule
