module top (
    input [3:0] A, B,
    input [2:0] opCodeA,
    input [1:0] select,
    input Cin,
    output [1:0] leds,
    output [11:0] Y
);


wire wire1, wire2;
wire [11:0] selectY;
ALU a1(.A(A), .B(B), .opCodeA(opCodeA), .CarryIN(Cin), .bcd(selectY), .CarryOUT(wire2), .overflow(wire1)); //ALU module
selector s1(.A(A), .B(B), .opCodeA(opCodeA), .select(select), .ALUY(selectY), .Y(Y));   // selector for 7 segment

assign leds[0] = ~wire1; //overflow led
assign leds[1] = ~wire2; //CarryOut/BorrowOut led

endmodule
