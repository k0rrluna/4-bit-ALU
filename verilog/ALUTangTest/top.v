module top (
    input [3:0] A, B,
    input [2:0] opCodeA,
    input [1:0] select,
    output [1:0] led,
    output [11:0] Y
);

wire wire1, wire2;
wire [11:0] selectY;
ALU a1( .A(A),
        .B(B),
        .opCodeA(opCodeA),
        .CarryIN(1'b0),
        .bcd(selectY),
        .CarryOUT(led[0]),
        .overflow(led[1]));
selector s1(.A(A), .B(B), .opCodeA(opCodeA), .select(select), .ALUY(selectY), .Y(Y));

endmodule
