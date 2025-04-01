module mux2_4_compl1(output reg [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s, input wire cpl);
    always @(*) begin
        if (s == 1'b0) begin
            Out = (cpl == 1'b1) ? ~A : A;
        end else begin
            Out = (cpl == 1'b1) ? ~B : B;
        end
    end
endmodule