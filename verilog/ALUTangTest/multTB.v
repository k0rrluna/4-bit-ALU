module multTB();

reg [3:0] A, B;
wire [7:0] Y;

multiplier uut (
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin
    $dumpfile("mult.vcd");
    $dumpvars;
    A = 4'b1000; B = 4'b1000; #5;
end

endmodule
