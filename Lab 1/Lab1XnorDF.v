module xnor_gate_dt (
	input a,
	input b,
	output y
);
	assign y = ~(a ^ b);

endmodule
