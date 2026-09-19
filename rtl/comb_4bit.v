// 4-bit combinational circuit: a switch (sw) selects between a free-
// running up counter (y0) and a rotate-based sequence (y1) as the
// displayed output.
// Reconstructed to match the original report's design intent (source PDF
// is OCR-scanned; see README). Verified to compile with Icarus Verilog.
// PIN configuration from the original report:
//   SW = J15, Clk = E3, Y[0] = H17, Y[1] = K15, Y[2] = J13, Y[3] = N14

module comb_4bit(
    input sw,
    input clk,
    output reg [3:0] y
);
    reg clk1 = 0;
    integer c = 0;
    reg [3:0] y0 = 4'b0000;
    reg [3:0] y1 = 4'b0001;

    always @(posedge clk) begin
        c = c + 1;
        if (c == 25000000) begin
            c = 0;
            clk1 = ~clk1;
        end
    end

    always @(posedge clk1) begin
        if (sw == 0)
            y0 = y0 + 1'b1;
        else
            y1 = {y1[2:0], y1[3]};
    end

    always @(sw, y0, y1) begin
        if (sw == 0)
            y = y0;
        else
            y = y1;
    end
endmodule
