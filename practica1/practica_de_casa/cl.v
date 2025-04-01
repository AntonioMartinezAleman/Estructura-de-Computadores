module cl(output wire out, input wire a, b, input wire [1:0] S);
  wire out_and, out_or, out_xor, out_neg;
  and and1(out_and, a, b);
  or or1(out_or, a , b);
  xor xor1(out_xor, a, b);
  not not1(out_neg, a);
  mux4_1 mux(out, out_and, out_or, out_xor, out_neg, S);
endmodule