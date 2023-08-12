`timescale 1ns / 1ps

module FullAdder_1Bit(a, b, cin, cout, sum);

input a, b, cin;
output cout, sum;
wire w1, w2, w3;

xor gate1(w1, a, b);
xor gate2(sum, w1, cin);
and gate3(w2, a, b);
and gate4(w3, w1, cin);
or gate5(cout, w2, w3); 

endmodule

module RippleCarryAdder_16Bit(A, B, Cin, Cout, Sum );

input [15:0] A, B;
input Cin;
output [15:0] Sum;
wire [14:0] C;
output Cout;

FullAdder_1Bit FA1(A[0], B[0], Cin, C[0], Sum[0]);
FullAdder_1Bit FA2(A[1], B[1], C[0], C[1], Sum[1]);
FullAdder_1Bit FA3(A[2], B[2], C[1], C[2], Sum[2]);
FullAdder_1Bit FA4(A[3], B[3], C[2], C[3], Sum[3]);
FullAdder_1Bit FA5(A[4], B[4], C[3], C[4], Sum[4]);
FullAdder_1Bit FA6(A[5], B[5], C[4], C[5], Sum[5]);
FullAdder_1Bit FA7(A[6], B[6], C[5], C[6], Sum[6]);
FullAdder_1Bit FA8(A[7], B[7], C[6], C[7], Sum[7]);
FullAdder_1Bit FA9(A[8], B[8], C[7], C[8], Sum[8]);
FullAdder_1Bit FA10(A[9], B[9], C[8], C[9], Sum[9]);
FullAdder_1Bit FA11(A[10], B[10], C[9], C[10], Sum[10]);
FullAdder_1Bit FA12(A[11], B[11], C[10], C[11], Sum[11]);
FullAdder_1Bit FA13(A[12], B[12], C[11], C[12], Sum[12]);
FullAdder_1Bit FA14(A[13], B[13], C[12], C[13], Sum[13]);
FullAdder_1Bit FA15(A[14], B[14], C[13], C[14], Sum[14]);
FullAdder_1Bit FA16(A[15], B[15], C[14], Cout, Sum[15]);

endmodule