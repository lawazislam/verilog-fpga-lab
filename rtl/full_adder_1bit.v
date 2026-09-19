// 1-bit Full Adder, built from two half adders
// Reconstructed to match the original report's structural instantiation
// (source PDF is OCR-scanned; see README). Verified to compile with
// Icarus Verilog.

`include "half_adder.v"

module full_adder_1bit(input Cin, input [1:0] X, output sum, Cout);
    wire S_W;
    wire [1:0] C_W;
    half_adder_dataflow U0(.A(Cin),  .B(X[0]), .S(S_W),  .C(C_W[0]));
    half_adder_dataflow U1(.A(S_W),  .B(X[1]), .S(sum),  .C(C_W[1]));
    assign Cout = C_W[1] | C_W[0];
endmodule
