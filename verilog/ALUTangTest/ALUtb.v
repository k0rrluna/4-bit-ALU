module ALUtb();

reg [3:0] A,B;
reg CarryIN;
reg [2:0] opCodeA;
wire CarryOUT, overflow;
wire [7:0] Y;

ALU uut (
    .A(A),
    .B(B),
    .CarryIN(CarryIN),
    .opCodeA(opCodeA),
    .CarryOUT(CarryOUT),
    .overflow(overflow),
    .Y(Y)
);

initial begin
    $dumpfile("ALU.vcd");
    $dumpvars;
    A = 4'b1111; B = 4'b0001; CarryIN = 1'b0; opCodeA = 3'b001; #5;
    $finish;
end

endmodule
