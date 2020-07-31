// -----------------------------------
// Fernando José Caceros Morales (19148)
// Basado en: http://www.asic-world.com/verilog/verilog_one_day1.html#Low_level_design
// Tabla 3 SOP 
// -----------------------------------
module Tabla3SOP();	// generar y nombrar un módulo
  

wire NA,NB,NC,ND,P1,P2,P3,P4,P5,P6,P7,S1;

reg A,B,C,D;	

// podemos utilizar compuertas nativas   

not NotA (NA, A);
not NotB (NB, B);
not NotC (NC, C);
not NotD (ND, D);

and And1 (P1, NA,NB,NC,ND);
and And2 (P2, NA,NB,NC,D);
and And3 (P3, NA,NB,C,ND);
and And4 (P4, NA,NB,C,D);
and And5 (P5, A,NB,NC,ND);
and And6 (P6, A,NB,C,ND);
and And7 (P7, A,B,C,ND);

or Or1 (S1, P1,P2,P3,P4,P5,P6,P7);		

// initial sirve para definir eventos desde el tiempo t = 0

initial begin	// noten el uso del begin y end
  //monitor nos permite rastrear cambios en las entradas y salidas
  // %b = binario %d = decimal %h = hex  \t = tabulación
  $monitor("%b %b %b %b| %b", A, B, C, D, S1);
  // Declaramos valores en el tiempo 0
  A = 0;
  B = 0;
  C = 0;
  D = 0;
  
  #1 D = 1;
  #1 C = 1; D=0;
  #1 D = 1;
  #1 B=1;C=0;D=0;
  #1 D=1;
  #1 C=1;D=0;
  #1 D=1;
  #1 A=1;B=0;C=0;D=0;
  #1 D = 1;
  #1 C = 1; D=0;
  #1 D = 1;
  #1 B=1;C=0;D=0;
  #1 D=1;
  #1 C=1;D=0;
  #1 D=1;
  
  #1 $finish;   // termina la simulación
end	
initial
    begin
      $dumpfile("Tabla-3-SOP_tb.vcd"); // noten que el nombre del archivo siempre es el que incluye el _tb y la extension es .vcd
      $dumpvars(0, Tabla3SOP); // noten que el nombre que está después del número 0 es el mismo que el nombre del módulo que estamos probando
    end
endmodule	//finalizar el módulo