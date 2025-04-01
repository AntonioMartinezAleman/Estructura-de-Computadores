fa(output wire c_out, sum, input wire a, b, c_in);
module fa(
  output wire c_out,
  output wire sum,
  input wire a,
  input wire b,
  input wire c_in
);

wire sum1, sum2;

assign sum1 = a ^ b;  // XOR para calcular la suma sin tener en cuenta el acarreo de entrada.
assign sum = sum1 ^ c_in;  // XOR para calcular la suma final, incluyendo el acarreo de entrada.

assign c_out = (a & b) | (sum1 & c_in);  // Operación OR y AND para calcular el acarreo de salida.

endmodule