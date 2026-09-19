`include "half_adder.v"
module tb;
    reg A, B; wire S, C;
    half_adder_dataflow uut(.A(A), .B(B), .S(S), .C(C));
    initial begin
        $display("A B | S C");
        A=0;B=0; #1 $display("%b %b | %b %b", A,B,S,C);
        A=0;B=1; #1 $display("%b %b | %b %b", A,B,S,C);
        A=1;B=0; #1 $display("%b %b | %b %b", A,B,S,C);
        A=1;B=1; #1 $display("%b %b | %b %b", A,B,S,C);
    end
endmodule
