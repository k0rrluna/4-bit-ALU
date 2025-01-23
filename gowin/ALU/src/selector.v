module selector (
    input [3:0] A,
    input [3:0] B,
    input [2:0] opCodeA,
    input [1:0] select,
    input [11:0] ALUY,
    output reg [11:0] Y
);

always @(*) begin
    case (select)
        2'b00: Y = {8'b00000000, A};          // Zero-extend A to 8 bits
        2'b01: Y = {8'b00000000, B};          // Zero-extend B to 8 bits
        2'b10: Y = {9'b000000000, opCodeA};   // Zero-extend opCodeA to 8 bits
        2'b11: Y = ALUY;                  // Directly assign ALUY
        default: Y = ALUY;         // Default case for safety
    endcase
end

endmodule
