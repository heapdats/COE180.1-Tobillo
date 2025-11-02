module hexTo7Seg(
  input [3:0] x,
  output reg [6:0] z
);


  always @*
  begin
  case (x)
				4'b0000 : z = 7'b1000000; //hexadecimal 0
            4'b0001 : z = 7'b1111001; //hexadecimal 1
            4'b0010 : z = 7'b0100100; //hexadecimal 2
            4'b0011 : z = 7'b0110000; //hexadecimal 3
            4'b0100 : z = 7'b0011001; //hexadecimal 4
            4'b0101 : z = 7'b0010010; //hexadecimal 5
            4'b0110 : z = 7'b0000010; //hexadecimal 6
            4'b0111 : z = 7'b1111000; //hexadecimal 7
            4'b1000 : z = 7'b0000000; //hexadecimal 8
            4'b1001 : z = 7'b0011000; //hexadecimal 9
            4'b1010 : z = 7'b0001000; //hexadecimal A
            4'b1011 : z = 7'b0000011; //hexadecimal B
            4'b1100 : z = 7'b1000110; //hexadecimal C
            4'b1101 : z = 7'b0100001; //hexadecimal d
            4'b1110 : z = 7'b0000110; //hexadecimal E
            4'b1111 : z = 7'b0001110; //hexadecimal F
            default : z = 7'b1111111; // All segments OFF
  endcase
end

endmodule
