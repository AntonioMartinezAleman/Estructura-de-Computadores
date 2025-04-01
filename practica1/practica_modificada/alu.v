module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire l);
    // instancio las conexiones entre dispositivos
    wire [0:3] out_op1, out_op2, salida_sum4, salida_ul4;
    // instancio las variables que necesito para el mux y la suma
    wire op1_A, cp1, cin0;

    // doy valor a los wire para que según necesite hagan una u otra cosa
    assign op1_A = l | ALUOp[1];
    assign cp1 = (~l) & (~ALUOp[1]) | (~l) & ALUOp[0];
    assign cin0 = (~ALUOp[1]) | ALUOp[0];

    // ejecuto los distintos modulos
    mux2_4 mux1(out_op1, 4'b0, A, op1_A);
    
    // Nueva instancia del módulo mux2_4_compl1 en lugar del mux2_4 y compl1
    mux2_4_compl1 mux2(out_op2, A, B, op1_A, cp1);
    
    sum4 sum(salida_sum4, carry, out_op1, out_op2, cin0);
    ul4 ul(salida_ul4, out_op1, out_op2, ALUOp);
    mux2_4 mux3(R, salida_sum4, salida_ul4, l);

    // el bit de signo será el bit más representativo de R
    assign sign = R[3];
    // zero se pondra a 1 cuando R valga 0000
    assign zero = (R == 4'b0) ? 1 : 0;
endmodule