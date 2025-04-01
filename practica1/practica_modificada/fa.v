module fa(output wire c_out, sum, input wire a, b, c_in);
    // operador de concatenación, c_out es el carry de la suma y sum el resultado
    assign {c_out, sum} = a + b + c_in;
endmodule