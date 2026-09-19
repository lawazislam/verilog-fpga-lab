// 16x2 LCD interface: steps through the standard HD44780-style
// initialisation sequence on a slow internal clock, driving the RS,
// E and 8-bit data bus lines.
// Reconstructed to match the original report's design intent (source PDF
// is OCR-scanned; see README). Verified to compile with Icarus Verilog.
// PIN configuration from the original report:
//   Clk = E3, RS = E16, RW = F13, E = G13
//   DB(0..7) = C17, D18, E18, G17, D17, E17, F18, G18

module lcd_interface(
    input clk,
    output rw,
    output reg rs,
    output reg e,
    output reg [7:0] db
);
    reg clk1 = 0;
    integer c = 0;
    integer n = 0;

    always @(posedge clk) begin
        c = c + 1;
        if (c == 7500000) begin
            c = 0;
            clk1 = ~clk1;
        end
    end

    always @(posedge clk1) begin
        if (n <= 9)
            n = n + 1;
    end

    always @(n) begin
        rs = (n < 7) ? 0 : 1;
        e  = (n <= 9) ? clk1 : 0;
    end

    always @(n) begin
        case (n)
            0: db = 8'h30;
            1: db = 8'h30;
            2: db = 8'h30;
            3: db = 8'h38;
            4: db = 8'h0C;
            5: db = 8'h06;
            6: db = 8'h01;
            7: db = 8'h45;
            8: db = 8'h44;
            9: db = 8'h41;
            default: db = 8'h00;
        endcase
    end

    assign rw = 0;
endmodule
