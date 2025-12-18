`timescale 1ns/1ps

module thunderbird_tb;
    reg Clk;
    reg Reset;
    reg Right_switch;
    reg Left_switch;

    wire L_A;
    wire L_B;
    wire L_C;

    wire R_A;
    wire R_B;
    wire R_C;

    wire Clk_div;

    thunderbird_wrapper dut(
        .Clk(Clk),
        .Reset(Reset),
        .Right_switch(Right_switch),
        .Left_switch(Left_switch),

        .L_A(L_A),
        .L_B(L_B),
        .L_C(L_C),
        .R_A(R_A),
        .R_B(R_B),
        .R_C(R_C)
    );

    initial begin
        Clk = 0;
        forever #1 Clk = ~Clk;
    end

    initial begin
        $dumpfile("thunderbird_tb.vcd");
        $dumpvars(0, thunderbird_tb);

        Reset = 1;
        Left_switch = 0;
        Right_switch = 0;
        #2;
        Reset = 0;

        Left_switch = 1;
        Right_switch = 1; #50;
        Left_switch = 0;
        Right_switch = 0; #100;

        Left_switch = 1;
        Right_switch = 1; #200;
        Left_switch = 0;
        Right_switch = 0; #100;
        
        Left_switch = 1;
        Right_switch = 1; #50;
        Left_switch = 0;
        Right_switch = 0; #50;
        Reset = 1; #10;
        Reset = 0; #40;
        
        Left_switch = 1; #50;
        Left_switch = 0;
        Right_switch = 1; #50;
        Right_switch = 0; #100;
        

        $finish;

    end
endmodule 