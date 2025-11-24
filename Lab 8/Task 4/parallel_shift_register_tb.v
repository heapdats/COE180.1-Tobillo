`timescale 1ns/1ps

module parallel_shift_register_tb;

    //Inputs
    reg Clk;
    reg shift_enable;
    reg Shift_in;
    reg load;
    reg [3:0] parallel_in;

    //Outputs
    wire [3:0] RegContent;
    wire Shift_out;

    // Module
    parallel_shift_register dut (
        .Clk(Clk),
        .shift_enable(shift_enable),
        .Shift_in(Shift_in),
        .load(load),
        .parallel_in(parallel_in),
        .RegContent(RegContent),
        .Shift_out(Shift_out)
    );

    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    initial begin
        $dumpfile("parallel_shift_register_tb.vcd");
        $dumpvars(0, parallel_shift_register_tb);

        // Initialize
        load = 0;
        shift_enable = 0;
        Shift_in = 1;
        parallel_in = 4'b0000;
        #20;

        parallel_in = 4'b0101; #40;
        load = 1; #20;
        load = 0; #20;

        shift_enable = 1; #100;
        load = 1; #10;
        load = 0; #55;

        load = 1; #10;
        load = 0; #25;
        shift_enable = 0; #40;

        load = 1; #10;
        load = 0; #20;

        $finish;
    end
endmodule

