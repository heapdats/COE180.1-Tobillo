module alu4(
    input [3:0] A,
    input [3:0] B,
    input [2:0] S,        // Operation select
    
    output Cout,           // Carry-out of MSB
	 output Overflow,
	 output Zero,
	 
    output [6:0] segR,      // 7-segment display Result
	 output [6:0] segA,      // 7-segment display A
	 output [6:0] segB,       // 7-segment display B
	 output [6:0] segS		// 7-segment display Operation
);

	 wire Binvert, Cin;      // Internal control for ADD/SUB
    wire c;			          // Internal carry wire
	 wire [3:0] aluR;			// Temporary storage for ALU output
	 wire [3:0] shiftL;		// Storage for Rotate Left
	 wire [3:0] shiftR;		// Storage for Rotate Right
	 wire [3:0] R;       	// 4-bit result
	 wire c_mid, c_mid2;
	 
	 
    // Determine Binvert and initial Cin automatically
    assign Binvert = (S == 3'b011);  // Invert B only for SUB
    assign Cin     = (S == 3'b011);  // Cin=1 for SUB, 0 otherwise
	
	// LSB 2-bit ALU
    alu2 lsb (
        .A(A[1:0]),
        .B(B[1:0]),
        .S(S[2:0]),      // Only need 2-bit S for alu2
		  .Cin(Cin),
        .R(aluR[1:0]),
        .Cout(c),
		  .c0(c_mid)
    );

    // MSB 2-bit ALU
    alu2 msb (
        .A(A[3:2]),
        .B(B[3:2]),
        .S(S[2:0]),
		  .Cin(c),
        .R(aluR[3:2]),
        .Cout(Cout),
		  .c0(c_mid2)
    );
	 
	 
	 // Bit shift Left
	 left left(
		.in(A),
		.out(shiftL)
	 );
	 
	 // Bit shift Right
	 right right(
		.in(A),
		.out(shiftR)
	 );
	 
	 // Is less than
	 
	 wire [3:0] slt = (A <   B) ? 4'b0001 : 4'b0000;
	 
	 assign R = (S == 3'b100) ? shiftL :
               (S == 3'b101) ? shiftR :
					(S == 3'b110) ? slt :
               aluR;
					
	 // Overflow detection
	 xor(Overflow, c_mid2, Cout);

	 
	 // Zero Flag Implementation
	 wire r_or1, r_or2, r_or3;

	 or (r_or1, R[3], R[2]);
 	 or (r_or2, R[1], R[0]);
	 or (r_or3, r_or1, r_or2);

	 not (Zero, r_or3);
			 
	 // Convert operands and result to 7-segment displays
    hexTo7Seg displayA (.x(A), .z(segA));
    hexTo7Seg displayB (.x(B), .z(segB));
    hexTo7Seg displayR (.x(R), .z(segR));
	 hexTo7Seg displayS (.x({1'b0,S}), .z(segS));

endmodule