// 2-to-1 MUX, dataflow and behavioural
// Y = S' . A0 + S . A1
// Reconstructed to match this equation (source PDF is OCR-scanned; see
// README). Verified to compile with Icarus Verilog.

module mux_2to1_dataflow(input S, input [1:0] A, output Y);
    assign Y = (S & A[1]) | (~S & A[0]);
endmodule

module mux_2to1_behavioural(input S, input [1:0] A, output reg Y);
    always @(S, A) begin
        if (S == 0)
            Y = A[0];
        else
            Y = A[1];
    end
endmodule
