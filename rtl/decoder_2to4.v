// 2-to-4 Decoder, dataflow and behavioural
// Truth table (from the original report):
//   E a b | Y3 Y2 Y1 Y0
//   1 x x |  1  1  1  1   (disabled: all outputs held high)
//   0 0 0 |  1  1  1  0
//   0 0 1 |  1  1  0  1
//   0 1 0 |  1  0  1  1
//   0 1 1 |  0  1  1  1
// Reconstructed to match this table (source PDF is OCR-scanned; see
// README). Verified to compile with Icarus Verilog.

module decoder_2to4_dataflow(input E, input [1:0] A, output [3:0] Y);
    assign Y[0] = E | (A[1]  | A[0]);
    assign Y[1] = E | (A[1]  | ~A[0]);
    assign Y[2] = E | (~A[1] | A[0]);
    assign Y[3] = E | (~A[1] | ~A[0]);
endmodule

module decoder_2to4_behavioural(input E, input [1:0] A, output reg [3:0] Y);
    always @(E, A) begin
        if (E == 1)
            Y = 4'b1111;
        else if (A == 0)
            Y = 4'b0001;
        else if (A == 1)
            Y = 4'b0010;
        else if (A == 2)
            Y = 4'b0100;
        else
            Y = 4'b1000;
    end
endmodule
