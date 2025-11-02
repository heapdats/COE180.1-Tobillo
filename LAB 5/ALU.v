module ALU (
    input  [8:0] SW,    // Switches for A, B, and Cin inputs
    input  [3:0] KEY,   // Push buttons for Operation and Mode selection
    output [6:0] HEX0,  // 7-segment display for output
    output LED0         // LED for Cout output
);

wire [3:0] A;
wire [3:0] B;
wire Cin;
wire [3:0] F;
wire Cout;

// Map inputs
assign A = SW[8:5];
assign B = SW[4:1];
assign Cin = SW[0];

// Instantiate the ALU
alu4 uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Operation(KEY[1:0]), // Operation select (KEY1, KEY0)
    .Mode(KEY[2]),        // Mode select (KEY2)
    .F(F),
    .Cout(Cout)
);


hexTo7Seg display (
    .x(F),
    .z(HEX0)
);

// Output Cout to LED
assign LED0 = Cout;

endmodule