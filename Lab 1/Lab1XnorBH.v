module xnor_gate_dt (
	input a,
	input b,
	output reg y
);
	always @(*) begin
		if (a == b) begin
			y = 1;
		end else begin
			y = 0;
		end
	end
endmodule

