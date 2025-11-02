module nor_gate_dt (
	input a,
	input b,
	output y
);
	assign y = ~(a | b);
endmodule