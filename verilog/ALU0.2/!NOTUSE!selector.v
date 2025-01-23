module selector (
    input [3:0] select,
    input [7:0] Y,
    input [3:0] A, B,
    input [2:0] opCodeA,
    output [7:0] s0
);

wire [3:0] a0, b0, tempAB, tempYO;
wire [7:0] y0;
wire [2:0] op0;
wire tempsO, temps;

// Select signals for A
and a00 (a0[0], select[0], A[0]);
and a01 (a0[1], select[0], A[1]);
and a02 (a0[2], select[0], A[2]);
and a03 (a0[3], select[0], A[3]);

// Select signals for B
and b00 (b0[0], select[1], B[0]);
and b01 (b0[1], select[1], B[1]);
and b02 (b0[2], select[1], B[2]);
and b03 (b0[3], select[1], B[3]);

// Select signals for Y
and y00 (y0[0], select[2], Y[0]);
and y01 (y0[1], select[2], Y[1]);
and y02 (y0[2], select[2], Y[2]);
and y03 (y0[3], select[2], Y[3]);
and y04 (y0[4], select[2], Y[4]);
and y05 (y0[5], select[2], Y[5]);
and y06 (y0[6], select[2], Y[6]);
and y07 (y0[7], select[2], Y[7]);

// Select signals for opCodeA
and op00 (op0[0], select[3], opCodeA[0]);
and op01 (op0[1], select[3], opCodeA[1]);
and op02 (op0[2], select[3], opCodeA[2]);

// Combine A and B
or or1 (tempAB[0], a0[0], b0[0]);
or or2 (tempAB[1], a0[1], b0[1]);
or or3 (tempAB[2], a0[2], b0[2]);
or or4 (tempAB[3], a0[3], b0[3]);

// Combine Y and opCodeA
or or5 (tempYO[0], y0[0], op0[0]);
or or6 (tempYO[1], y0[1], op0[1]);
or or7 (tempYO[2], y0[2], op0[2]);
or or8 (tempYO[3], y0[3], 1'b0);

// NOR for select logic
nor s01 (tempsO, select[0], select[1]);
nor s02 (temps, tempsO, select[3]);

// Final s0 connections
or or9 (s0[0], tempAB[0], tempYO[0]);
or or10 (s0[1], tempAB[1], tempYO[1]);
or or11 (s0[2], tempAB[2], tempYO[2]);
or or12 (s0[3], tempAB[3], tempYO[3]);

and and13 (s0[4], y0[4], temps);
and and14 (s0[5], y0[5], temps);
and and15 (s0[6], y0[6], temps);
and and16 (s0[7], y0[7], temps);

endmodule
