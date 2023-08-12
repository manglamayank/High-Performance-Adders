`timescale 1ns / 1ps

module Kogge_Stone_4Bit(a, b, cin, s, cout);

input [3:0] a, b;
input cin;
output [3:0] s;
output cout;
wire [3:0] P, G, C;
wire P01, P02, P03, G01, G02, G03, G12, P12, G23, P23;

assign P[0] = a[0] ^ b[0];
assign P[1] = a[1] ^ b[1];
assign P[2] = a[2] ^ b[2];
assign P[3] = a[3] ^ b[3];

assign G[0] = a[0] & b[0];
assign G[1] = a[1] & b[1];
assign G[2] = a[2] & b[2];
assign G[3] = a[3] & b[3];

dot d01(G[0], P[0], G[1], P[1], G01, P01);
dot d12(G[1], P[1], G[2], P[2], G12, P12);
dot d23(G[2], P[2], G[3], P[3], G23, P23);
dot d02(G[0], P[0], G12, P12, G02, P02);
dot d03(G01, P01, G23, P23, G03, P03); 

assign C[0] = G[0] | (P[0] & cin);
assign C[1] = G01 | (P01 & cin);
assign C[2] = G02 | (P02 & cin);
assign C[3] = G03 | (P03 & cin);

assign s[0] = a[0] ^ b[0] ^ cin;
assign s[1] = a[1] ^ b[1] ^ C[0];
assign s[2] = a[2] ^ b[2] ^ C[1];
assign s[3] = a[3] ^ b[3] ^ C[2];

assign cout = C[3];

endmodule