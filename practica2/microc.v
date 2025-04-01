module microc(output wire [5:0] Opcode, output wire zero, input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] ALUOp);
//Microcontrolador sin memoria de datos de un solo ciclo
    assign Opcode = OUT[15:10];  //se seleccionan los bits del 15 al 10 de esa señal

//mux_1
    wire [9:0] s_sum_a_mux1; 
    wire [9:0] s_mux1_a_pc; 
    wire [9:0] salto = OUT[9:0];
    mux2 #(10) mux_1(s_mux1_a_pc, salto, s_sum_a_mux1, s_inc); //Out= de mux a pc In= salto, de sum a mux y s_inc

//sumador
    wire [9:0] s_pc_out;  //cable que sale de PC
    sum sum_1(s_sum_a_mux1, 10'b0000000001, s_pc_out); //Out = de sum a mux, In = pc out y un 1 

//memoria de programa
    wire [15:0] OUT; //salida de memoria de programa
    memprog memprog1(OUT, clk, s_pc_out); //Out= OUT, In = reloj y pc out

//mux_2
    wire[3:0] s_mux2_a_banco; 
    wire [3:0] RA1 = OUT[11:8]; //Entrada a mux_2. Bits del 11 al 8 del wire OUT
    wire [3:0] WA3 = OUT[3:0]; //Otra entrada al mux_2. Bits del 3 al 0 del wire OUT
    mux2 #(4) mux_2(s_mux2_a_banco, RA1, WA3, s_inm); //Out = de mux2 a banco, In = Ra1 y Wa3

//Banco de registros
    wire [3:0] RA2 = OUT[7:4]; //Entrada a banco, Bits del 7 al 4
    wire [7:0] RD1; //Out de regfile
    wire [7:0] RD2; //Out de regfile
    wire [7:0] WD3; //In de alu a reg
    regfile regfile_1(RD1, RD2, clk, we3, s_mux2_a_banco, RA2, WA3, WD3); //Out= RD1 y RD2

//mux_3
    wire [7:0] s_mux3_a_alu; 
    wire [7:0] Inm = OUT[11:4]; //Entrada a mux3, Bits del 11 al 4
    mux2 #(8) mux_3(s_mux3_a_alu, RD2, Inm, s_inm);

//ALU
    wire zALU; //de Alu a flipflop
    alu alu_1(WD3, zALU, RD1, s_mux3_a_alu, ALUOp);

//flipflop
    ffd flipflop(clk, reset, zALU, wez, zero);

//PC
    registro #(10) registro_1(s_pc_out, clk, reset, s_mux1_a_pc);
    
endmodule
