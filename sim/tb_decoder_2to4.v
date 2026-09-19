`include "decoder_2to4.v"
module tb;
    reg E; reg [1:0] A; wire [3:0] Y;
    decoder_2to4_dataflow uut(.E(E), .A(A), .Y(Y));
    initial begin
        $display("E A | Y3 Y2 Y1 Y0  (expect 1 x x -> 1111)");
        E=1;A=2'bxx; #1 $display("%b %b | %b", E,A,Y);
        E=0;A=0; #1 $display("%b %b | %b", E,A,Y);
        E=0;A=1; #1 $display("%b %b | %b", E,A,Y);
        E=0;A=2; #1 $display("%b %b | %b", E,A,Y);
        E=0;A=3; #1 $display("%b %b | %b", E,A,Y);
    end
endmodule
