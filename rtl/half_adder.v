// Half Adder, dataflow and behavioural
// Reconstructed to match the truth table and description in the original
// report (source PDF is OCR-scanned; see README). Verified to compile
// with Icarus Verilog.

module half_adder_dataflow(input A, B, output S, C);
    assign S = A ^ B;
    assign C = A & B;
endmodule

module half_adder_behavioural(input a, b, output reg s, c);
    always @(a, b) begin
        s = a ^ b;
        c = a & b;
    end
endmodule
