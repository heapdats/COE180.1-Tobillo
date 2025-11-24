`timescale 1ns/1ps

module serial_shift_register_tb;

    reg Clk;
    reg Shift_in;
    wire Shift_out;

    serial_shift_register dut (
        .Clk(Clk),
        .Shift_in(Shift_in),
        .Shift_out(Shift_out)
    );

    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk;
    end

    initial begin
        $dumpfile("serial_shift_register_tb.vcd");
        $dumpvars(0, serial_shift_register_tb);
        Shift_in = 0; #20;
        Shift_in = 1; #40;
        Shift_in = 0; #20;
        Shift_in = 1; #40;
        Shift_in = 0; #80;
        $finish;
    end
endmodule