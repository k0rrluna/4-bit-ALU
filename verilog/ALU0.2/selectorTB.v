module selectorTB();

reg [3:0] select, A, B;
reg [7:0] Y;
reg [2:0] opCodeA;
wire [7:0] s0;

selector uut (
    .select(select),
    .A(A),
    .B(B),
    .opCodeA(opCodeA),
    .s0(s0)
);

initial begin
    $dumpfile("selector.vcd");
    $dumpvars;
    A = 4'b0001; B = 4'b0010; opCodeA = 3'b111; Y = 8'b1111_0000; select = 4'b0010; #5;
    A = 4'b0001; B = 4'b0010; opCodeA = 3'b111; Y = 8'b1111_0000; select = 4'b0001; #5;
    A = 4'b0001; B = 4'b0010; opCodeA = 3'b111; Y = 8'b0111_0000; select = 4'b0100; #5;
    A = 4'b0001; B = 4'b0010; opCodeA = 3'b111; Y = 8'b0111_0000; select = 4'b1000; #5;
    $finish;
end

endmodule
