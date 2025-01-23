module topTB();

reg [3:0] A,B;
reg [2:0] opCodeA;
reg [1:0] select;
wire [1:0] led;
wire [11:0] Y;

top uut (
    .A(A),
    .B(B),
    .opCodeA(opCodeA),
    .select(select),
    .led(led),
    .Y(Y)
);

initial begin
    $dumpfile("top.vcd");
    $dumpvars;
    A = 4'b1111; B = 4'b1111; opCodeA = 3'b000; select = 2'b01; #5;
    A = 4'b0000; B = 4'b1111; opCodeA = 3'b001; select = 2'b01; #5;
    A = 4'b1111; B = 4'b0001; opCodeA = 3'b001; select = 2'b01; #5;
    A = 4'b1111; B = 4'b0001; opCodeA = 3'b001; select = 2'b11; #5;
    $finish;
end

endmodule
