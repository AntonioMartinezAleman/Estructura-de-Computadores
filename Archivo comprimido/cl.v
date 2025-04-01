cl(output wire out, input wire a, b, input wire [1:0] S);
module cl(
  output wire out,
  input wire a,
  input wire b,
  input wire [1:0] S
);

always @(*) begin
  case(S)
    2'b00: out = a & b;    // Operación lógica AND
    2'b01: out = a | b;    // Operación lógica OR
    2'b10: out = a ^ b;    // Operación lógica XOR
    2'b11: out = ~a;       // Inversión del bit 'a'
    default: out = 1'b0;   // Manejar un caso por defecto si es necesario
  endcase
end

endmodule