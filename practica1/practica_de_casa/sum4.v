module sum4(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);
    // intancio los wire que conectarán los fa en linea para pasar el bit de carry
    wire c1;
    wire c2;
    wire c3;
    // ejecuto los modulos teniendo en cuenta los bits de carry
    fa fa1(c1, S[0], A[0], B[0], c_in);
    fa fa2(c2, S[1], A[1], B[1], c1);
    fa fa3(c3, S[2], A[2], B[2], c2);
    fa fa4(c_out, S[3], A[3], B[3], c3);
endmodule