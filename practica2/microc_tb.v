// Testbench para sumador con predicción de acarreo
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y el del paso de simulacion
module microc_tb;

//declaracion de señales
wire[5:0] test_Opcode;
wire test_zero;
reg test_clk;
reg test_reset;
reg test_s_inc;
reg test_s_inm;
reg test_we3;
reg test_wez;
reg[2:0] test_ALUOp;

//instancia del modulo a testear
microc microc_1(test_Opcode, test_zero, test_clk, test_reset, test_s_inc, test_s_inm, test_we3, test_wez, test_ALUOp);

  always
  #20 test_clk = ~test_clk;

initial
  begin
    test_reset = 1;
    # 10;
    test_reset = 0;
  end

initial
  begin
    $dumpfile("cpu_tb.vcd");
    $dumpvars;
    # 20;

    //LI #2 R5 0 0
    test_s_inc = 1; //zero cuando hace un salto
    test_s_inm = 1; //inmediato vale
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b000; 

    #40; // LI #0 R4 1 1
    test_s_inc = 1;
    test_s_inm = 1;
    test_we3 = 1;
    test_wez = 1;
    test_ALUOp = 3'b000;

    #40;  //LI #1 R6 2 2
    test_s_inc = 1; 
    test_s_inm = 1; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b000; //operacion del alu =


    #40; //LI #2 R7 3 3
    test_s_inc = 1; 
    test_s_inm = 1; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b000; //operacion del alu =

    #40;  //BCNT: AND R5 R6 R0 4 4
    test_s_inc = 1; 
    test_s_inm = 0; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b100; //operacion del alu =


    #40;  //JZ NOINC 5 5
    test_s_inc = 0; 
    test_s_inm = 0; 
    test_we3 = 0;  
    test_wez = 0;  
    test_ALUOp = 3'b000; //operacion del alu =

    #40;  // NOINC: ADD R6 R6 R6 6 7
    test_s_inc = 0; 
    test_s_inm = 0; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b010; //operacion del alu =

    #40;  // SBI #1 R7 7 8
    test_s_inc = 1; 
    test_s_inm = 1; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b011; //operacion del alu =

    #40;  // JNZ BCNT 8 9
    test_s_inc = 0; 
    test_s_inm = 0; 
    test_we3 = 0;  
    test_wez = 0;  
    test_ALUOp = 3'b000; //operacion del alu =

    #40;  //  BCNT: AND R5 R6 R0  9 4
    test_s_inc = 1; 
    test_s_inm = 0; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b100; //operacion del alu =

    #40;  //  JZ NOINC  10 5
    test_s_inc = 0; 
    test_s_inm = 0; 
    test_we3 = 0;  
    test_wez = 0;  
    test_ALUOp = 3'b000; //operacion del alu =

    #40;  // ADI #1 R4  11 6
    test_s_inc = 1; 
    test_s_inm = 1; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b010; //operacion del alu =

    #40;  // NOINC: ADD R6 R6 R6  12 7
    test_s_inc = 1; 
    test_s_inm = 0; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b100; //operacion del alu =

    #40;  // SBI #1 R7   13 8
    test_s_inc = 1; 
    test_s_inm = 1; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b011; //operacion del alu =

    #40;  // JNZ BCN   14 9
    test_s_inc = 0; 
    test_s_inm = 0; 
    test_we3 = 0;  
    test_wez = 0;  
    test_ALUOp = 3'b000; //operacion del alu =

    #40;  // NAND R4 R4 R0  15 10
    test_s_inc = 1; 
    test_s_inm = 1; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b110; //operacion del alu =

    #40;  // FIN: J FIN   16 11
    test_s_inc = 0; 
    test_s_inm = 0; 
    test_we3 = 0;  
    test_wez = 0;  
    test_ALUOp = 3'b000; //operacion del alu =

    #40;  // NAND R4 R4 R0  17 10
    test_s_inc = 1; 
    test_s_inm = 0; 
    test_we3 = 1;  
    test_wez = 1;  
    test_ALUOp = 3'b110; //operacion del alu =

    #40;  // FIN: J FIN   18 11
    test_s_inc = 0; 
    test_s_inm = 0; 
    test_we3 = 0;  
    test_wez = 0;  
    test_ALUOp = 3'b000; //operacion del alu =

    #40;
      $finish;
  end

endmodule