// 4-bit up counter with an on-board clock divider
// Reconstructed to match the original report's design intent (source PDF
// is OCR-scanned; see README). Verified to compile with Icarus Verilog.
// PIN configuration from the original report (Nexys/Artix-7 board):
//   Clk = E3, Y[0] = H17, Y[1] = K15, Y[2] = J13, Y[3] = N14

module counter_4bit(
    input clk,
    output reg [3:0] y = 4'b0000
);
    reg clk1 = 0;
    integer c = 0;

    always @(posedge clk) begin
        c = c + 1;
        if (c == 25000000) begin
            c = 0;
            clk1 = ~clk1;
        end
    end

    always @(posedge clk1) begin
        y = y + 1'b1;
    end
endmodule
