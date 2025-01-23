module divider (
    input [3:0] D,
    input [1:0] d,
    output [2:0] R,
    output [3:0] Q
);

wire s1,y1,c1;

dividerpu d1 (.A(D[3]), .B(d[0]), .Cin(1'b1), .S(s1), .Y(y1), .COut(c1));
dividerpu d2 (.A(1'b0), .B(d[1]), .Cin(c1), .S(s1), .Y(y1), .COut(c1));