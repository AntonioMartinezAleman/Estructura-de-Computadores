module ul4(output wire[3:0] out, input wire[3:0] a, input wire[3:0] b, input wire [1:0] s);
    // ejecuto los modulos para cada bit de a y b
    cl cl1(out[0], a[0], b[0], s);
    cl cl2(out[1], a[1], b[1], s);
    cl cl3(out[2], a[2], b[2], s);
    cl cl4(out[3], a[3], b[3], s);
endmodule