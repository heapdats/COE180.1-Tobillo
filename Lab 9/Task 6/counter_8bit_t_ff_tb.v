`timescale 1ns/1ps

module counter_tb;
    reg Clk;
    reg Reset;
    reg Enable;
    wire [7:0] Q;

    counter dut (
        .Clk(Clk),
        .Reset(Reset),
        .Enable(Enable),   
        .Q(Q)
    );

    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
        Enable = 0;
        Reset = 0;
        #20;

        Enable = 1; #20;
        Reset = 1; #80;

        Enable = 0; #80;
        Enable = 1; #300;
        $finish;
    end
endmodule