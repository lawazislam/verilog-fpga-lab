// 7-segment display controller: cycles a 4-digit multiplexed display
// through digits 0-7 on a slow internal clock, driving a shared anode
// data bus (d) and the active-low segment pattern (seg).
// Reconstructed to match the original report's design intent (source PDF
// is OCR-scanned; see README). Verified to compile with Icarus Verilog.
// PIN configuration from the original report:
//   Seg(0..7) = H15, L18, T11, P15, K13, K16, R10, T10
//   D(0..7)   = J17, J18, T9, J14, P14, T14, K2, V13

module seg7_display(
    input clk,
    output reg [7:0] d = 8'hFE,
    output reg [7:0] seg
);
    reg clk1 = 0;
    integer c = 0;
    reg [2:0] n = 0;

    always @(posedge clk) begin
        c = c + 1;
        if (c == 100000) begin
            c = 0;
            clk1 = ~clk1;
        end
    end

    always @(posedge clk1) begin
        n = n + 1'b1;
        d = {d[6:0], d[7]};
    end

    always @(n) begin
        case (n)
            0: seg = 8'h03;
            1: seg = 8'h9F;
            2: seg = 8'h25;
            3: seg = 8'h0D;
            4: seg = 8'h99;
            5: seg = 8'h49;
            6: seg = 8'h41;
            7: seg = 8'h1F;
            default: seg = 8'hFF;
        endcase
    end
