module compl1(output reg [3:0] Out, input wire [3:0] Inp, input wire cpl);
    always @*
    begin
        // si la señal de complemento está activada, hago el complemento a 1 si no, la salida es la entrada
        if (cpl == 1) Out = ~Inp;
        else Out = Inp;
    end
endmodule