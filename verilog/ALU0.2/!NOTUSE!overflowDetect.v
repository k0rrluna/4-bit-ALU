module overflowDetect (
    input [1:0] opCode,
    input [3:0] A, B,
    input [3:0] Y,
    input CarryOUT,
    output overflowDetect
);

wire opC;
wire sign1, sign2, sign3, sign4;
wire addOverflow, subOverflow;
wire detect1, detect2;

or o1 (opC, opCode[0], opCode[1]); //check add or sub

xnor xno1 (sign1, A[3], B[3]); // A B same sign
xor xo2 (sign3, A[3], B[3]); // A and B opposite sign

xor xo1 (sign2, Y[3], A[3]); // A and Sum opposite sign

and a01 (addOverflow, sign1, opCode[0]); // A B same for add
and a02 (subOverflow, sign3, opCode[1]); // A B diff for sub

or o2 (detect1, addOverflow, subOverflow);

and a03(detect2, detect1, sign2);
and a04(overflowDetect, opC, detect2);

endmodule
