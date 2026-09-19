// 4-to-1 MUX, built from three 2-to-1 muxes
// Reconstructed to match the original report's structural instantiation
// (source PDF is OCR-scanned; see README). Verified to compile with
// Icarus Verilog.

`include "mux_2to1.v"

module mux_4to1(input [1:0] S1, input [3:0] A1, output Y1);
    wire [1:0] Y_W;
    mux_2to1_dataflow U0(.S(S1[0]), .A(A1[3:2]), .Y(Y_W[1]));
    mux_2to1_dataflow U1(.S(S1[0]), .A(A1[1:0]), .Y(Y_W[0]));
    mux_2to1_dataflow U2(.S(S1[1]), .A(Y_W),     .Y(Y1));
endmodule
