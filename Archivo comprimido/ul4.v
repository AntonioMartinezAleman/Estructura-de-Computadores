ul4(output wire[3:0] Out, input wire[3:0] A, input wire[3:0] B, input wire [1:0] S);
module ul4(
  output wire [3:0] Out,
  input wire [3:0] A,
  input wire [3:0] B,
  input wire [1:0] S
);

wire [3:0] cl0_out, cl1_out, cl2_out, cl3_out;

// Conexiones de las celdas lógicas
cl cl0(.out(cl0_out), .a(A[0]), .b(B[0]), .S(S));
cl cl1(.out(cl1_out), .a(A[1]), .b(B[1]), .S(S));
cl cl2(.out(cl2_out), .a(A[2]), .b(B[2]), .S(S));
cl cl3(.out(cl3_out), .a(A[3]), .b(B[3]), .S(S));

// Salida de la unidad lógica de 4 bits
assign Out = {cl3_out, cl2_out, cl1_out, cl0_out};

endmodule