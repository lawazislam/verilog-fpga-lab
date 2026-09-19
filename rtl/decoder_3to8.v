// 3-to-8 Decoder, built from two 2-to-4 decoders
// Reconstructed to match the original report's structural instantiation
// (source PDF is OCR-scanned; see README). Verified to compile with
// Icarus Verilog.

`include "decoder_2to4.v"

module decoder_3to8(input [2:0] A1, output [7:0] Y1);
    decoder_2to4_dataflow U0(.E(A1[2]),  .A(A1[1:0]), .Y(Y1[7:4]));
    decoder_2to4_dataflow U1(.E(~A1[2]), .A(A1[1:0]), .Y(Y1[3:0]));
endmodule
