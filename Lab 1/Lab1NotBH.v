module not_gate_dt (
	input a,
	output reg y
);
	always @(*) begin
		y = ~a;
	end
endmodule
