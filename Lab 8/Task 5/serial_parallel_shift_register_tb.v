`timescale 1ns/1ps

module serial_parallel_shift_register_tb;

    //Inputs
    reg Clk;
    reg Shift_enable;
    reg Shift_in;

    //Outputs
    wire [3:0] Parallel_out;
    wire Shift_out;

    // Module
    serial_parallel_shift_register dut (
        .Clk(Clk),
        .Shift_enable(Shift_enable),
        .Shift_in(Shift_in),
        .Parallel_out(Parallel_out),
        .Shift_out(Shift_out)
    );

    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk;
    end

    initial begin
        $dumpfile("serial_parallel_shift_register_tb.vcd");
        $dumpvars(0, serial_parallel_shift_register_tb);

        // Initialize
        Shift_enable = 0;
        Shift_in = 1;
        #40;

        // Enable shifting
        Shift_enable = 1; #40;
        Shift_enable = 0; #40;
        Shift_enable = 1; #40;
        Shift_enable = 0; #40;

        Shift_in = 0; #40;
        Shift_enable = 1; #40;
        Shift_enable = 0; #40;
        Shift_enable = 1; #40;
        Shift_enable = 0; #40;
        $finish;
    end
endmodule

