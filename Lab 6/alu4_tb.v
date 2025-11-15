`timescale 1ns/1ps
module alu4_tb;

    reg  [3:0] A, B;
    reg  [2:0] S;
    wire Cout, Overflow, Zero;
    wire [6:0] segR, segA, segB, segS;

    // Add R output (you must expose it in alu4 if not already)
    wire [3:0] R = dut.R;

    // DUT
    alu4 dut(
        .A(A),
        .B(B),
        .S(S),
        .Cout(Cout),
        .Overflow(Overflow),
        .Zero(Zero),
        .segR(segR),
        .segA(segA),
        .segB(segB),
        .segS(segS)
    );

    // Task to print results nicely
    task print_state;
    begin
        $display("Time=%0t  S=%b  A=%b  B=%b  |  R=%b  Cout=%b  OF=%b  Zero=%b",
                 $time, S, A, B, R, Cout, Overflow, Zero);
    end
    endtask

    initial begin
        $dumpfile("alu4_tb.vcd");   // Output VCD file
        $dumpvars(0, alu4_tb);      // Dump all signals in this module
        $display("\n---------------- START ALU4 TEST ----------------\n");

        // ============================
        //        S = 000 (AND)
        // ============================
        S = 3'b000;
        A=4'b0000; B=4'b1111; #10; print_state();
        A=4'b1010; B=4'b1100; #10; print_state();
        A=4'b1111; B=4'b1111; #10; print_state();

        // ============================
        //        S = 001 (OR)
        // ============================
        S = 3'b001;
        A=4'b0000; B=4'b1111; #10; print_state();
        A=4'b1010; B=4'b0101; #10; print_state();
        A=4'b1000; B=4'b0001; #10; print_state();

        // ============================
        //        S = 010 (ADD)
        // ============================
        S = 3'b010;
        A=4'b0001; B=4'b0001; #10; print_state();
        A=4'b0011; B=4'b0101; #10; print_state();   // expect 1000
        A=4'b1111; B=4'b0001; #10; print_state();   // overflow

        // ============================
        //        S = 011 (SUB)
        // ============================
        S = 3'b011;
        A=4'b0100; B=4'b0010; #10; print_state();
        A=4'b0011; B=4'b0101; #10; print_state();
        A=4'b1000; B=4'b0001; #10; print_state();

        // ============================
        //        S = 100 (SHIFT LEFT)
        // ============================
        S = 3'b100;
        B = 4'b0000;
        A=4'b0001; #10; print_state();
        A=4'b1010; #10; print_state();
        A=4'b1111; #10; print_state();

        // ============================
        //        S = 101 (SHIFT RIGHT)
        // ============================
        S = 3'b101;
        B = 4'b0000;
        A=4'b1000; #10; print_state();
        A=4'b1010; #10; print_state();
        A=4'b1111; #10; print_state();

        // ============================
        //        S = 110 (SLT)
        // ============================
        S = 3'b110;
        A=4'b0011; B=4'b0100; #10; print_state();   // A<B = 1
        A=4'b1000; B=4'b0111; #10; print_state();   // signed compare
        A=4'b0100; B=4'b0011; #10; print_state();   // A>B = 0

        $display("\n---------------- END OF TEST ----------------\n");
        $finish;
    end

endmodule
