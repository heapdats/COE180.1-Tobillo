`timescale 1ns/1ps
module SR_latch_bh (input S, input R, output reg Q, output reg Qbar);
    always @ (S, R) begin
        case ({S,R})
            2'b10: begin Q = 1; Qbar = 0; end
            2'b01: begin Q = 0; Qbar = 1; end
            2'b00: ; // Hold
            default: begin Q = 1'bx; Qbar = 1'bx; end // Invalid
        endcase
    end
endmodule
