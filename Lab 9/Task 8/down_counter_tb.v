`timescale 1ns/1ps

module down_counter_tb;
    reg Clk;
    reg load;
    reg enable;
    reg clear;
    wire [3:0] Q;

    down_counter dut (
        .Clk(Clk),
        .load(load),
        .enable(enable),
        .clear(clear),
        .Q(Q)
    );

    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    initial begin
        $dumpfile("down_counter_tb.vcd");
        $dumpvars(0, down_counter_tb);
        
        // Initial conditions
        load = 0;
        enable = 0;
        clear = 0;
        #20;

        enable = 1; #20;
        clear = 1; #10;
        clear = 0; #20;

        load = 1; #10;
        load = 0; #80;

        enable = 0; #40;
        enable = 1; #190;

        $finish;
    end
endmodule