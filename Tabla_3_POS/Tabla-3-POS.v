// -----------------------------------
// Fernando José Caceros Morales (19148)
// Basado en: http://www.asic-world.com/verilog/verilog_one_day1.html#Low_level_design
// Tabla 3 POS 
// -----------------------------------
module Tabla3POS();	// generar y nombrar un módulo
  

wire NA,NB,NC,ND,S1,S2,S3,S4,S5,S6,S7,S8,S9,P1;

reg A,B,C,D;	

// podemos utilizar compuertas nativas   

not NotA (NA, A);
not NotB (NB, B);
not NotC (NC, C);
not NotD (ND, D);

or Or1 (S1, A,NB,C,D);
or Or2 (S2, A,NB,C,ND);
or Or3 (S3, A,NB,NC,D);
or Or4 (S4, A,NB,NC,ND);
or Or5 (S5, NA,B,C,ND);
or Or6 (S6, NA,B,NC,ND);
or Or7 (S7, NA,NB,NC,ND);
or Or8 (S8, NA,NB,C,D);
or Or9 (S9, NA,NB,C,ND);

and And1 (P1, S1,S2,S3,S4,S5,S6,S7,S8,S9);		

// initial sirve para definir eventos desde el tiempo t = 0

initial begin	// noten el uso del begin y end
  //monitor nos permite rastrear cambios en las entradas y salidas
  // %b = binario %d = decimal %h = hex  \t = tabulación
  $monitor("%b %b %b %b| %b", A, B, C, D, P1);
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
      $dumpfile("Tabla-3-POS.v"); // noten que el nombre del archivo siempre es el que incluye el _tb y la extension es .vcd
      $dumpvars(0, Tabla3POS); // noten que el nombre que está después del número 0 es el mismo que el nombre del módulo que estamos probando
    end
endmodule	//finalizar el módulo