`timescale 1ns / 1ps

module Brent_Kung_8Bit(a, b, cin, s, cout);

input [7:0] a, b;
input cin;
output [7:0] s;
output cout;
wire [7:0] P, G, C;
wire P01, P02, P03, P04, P05, P06, P07, G01, G02, G03, G04, G05, G06, G07, G23, P23, G45, P45, G67, P67, G47, P47;

// PROPOGATOR
assign P[0] = a[0] ^ b[0];
assign P[1] = a[1] ^ b[1];
assign P[2] = a[2] ^ b[2];
assign P[3] = a[3] ^ b[3];
assign P[4] = a[4] ^ b[4];
assign P[5] = a[5] ^ b[5];
assign P[6] = a[6] ^ b[6];
assign P[7] = a[7] ^ b[7];

// GENERATOR
assign G[0] = a[0] & b[0];
assign G[1] = a[1] & b[1];
assign G[2] = a[2] & b[2];
assign G[3] = a[3] & b[3];
assign G[4] = a[4] & b[4];
assign G[5] = a[5] & b[5];
assign G[6] = a[6] & b[6];
assign G[7] = a[7] & b[7];

// LEVEL 1
dot d01(G[0], P[0], G[1], P[1], G01, P01); // REQ1 
dot d23(G[2], P[2], G[3], P[3], G23, P23);
dot d45(G[4], P[4], G[5], P[5], G45, P45);
dot d67(G[6], P[6], G[7], P[7], G67, P67);
// LEVEL 2
dot d02(G01, P01, G[2], P[2], G02, P02); // REQ2
dot d03(G01, P01, G23, P23, G03, P03); // REQ3
dot d47(G45, P45, G67, P67, G47, P47);
// LEVEL 3
dot d04(G03, P03, G[4], P[4], G04, P04); // REQ4
dot d05(G03, P03, G[5], P[5], G05, P05); // REQ5
dot d07(G03, P03, G47, P47, G07, P07); // REQ7
// LEVEL 4
dot d06(G05, P05, G[6], P[6], G06, P06); // REQ6

// CARRY GENERATION
assign C[0] = G[0] | (P[0] & cin);
assign C[1] = G01 | (P01 & cin);
assign C[2] = G02 | (P02 & cin);
assign C[3] = G03 | (P03 & cin);
assign C[4] = G04 | (P04 & cin);
assign C[5] = G05 | (P05 & cin);
assign C[6] = G06 | (P06 & cin);
assign C[7] = G07 | (P07 & cin);

// SUM COMPUTATION
assign s[0] = a[0] ^ b[0] ^ cin;
assign s[1] = a[1] ^ b[1] ^ C[0];
assign s[2] = a[2] ^ b[2] ^ C[1];
assign s[3] = a[3] ^ b[3] ^ C[2];
assign s[4] = a[4] ^ b[4] ^ C[3];
assign s[5] = a[5] ^ b[5] ^ C[4];
assign s[6] = a[6] ^ b[6] ^ C[5];
assign s[7] = a[7] ^ b[7] ^ C[6];

// CARRY OUT ASSIGNMENT
assign cout = C[7];

endmodule
