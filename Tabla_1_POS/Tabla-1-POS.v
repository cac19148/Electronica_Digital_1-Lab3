// -----------------------------------
// Fernando José Caceros Morales (19148)
// Basado en: http://www.asic-world.com/verilog/verilog_one_day1.html#Low_level_design
// Tabla 1 POS 
// -----------------------------------
module Tabla1POS();	// generar y nombrar un módulo
  

wire NA,NB,NC,S1,S2,S3,S4,S5,P1;

reg A,B,C;	

// podemos utilizar compuertas nativas   

not NotA (NA, A);
not NotB (NB, B);
not NotC (NC, C);

or Or1 (S1, A,B,NC);
or Or2 (S2, A,NB,NC);
or Or3 (S3, NA,NB,NC);

and And1 (P1, S1,S2,S3);		

// initial sirve para definir eventos desde el tiempo t = 0

initial begin	// noten el uso del begin y end
  //monitor nos permite rastrear cambios en las entradas y salidas
  // %b = binario %d = decimal %h = hex  \t = tabulación
  $monitor("%b %b %b | %b", A, B, C, P1);
  // Declaramos valores en el tiempo 0
  A = 0;
  B = 0;
  C = 0;
  
  #1 C = 1;
  #1 B = 1; C=0;
  #1 C = 1;
  #1 A=1;B=0;C=0;
  #1 C=1;
  #1 B=1;C=0;
  #1 C=1;
  #1 $finish;   // termina la simulación
end	
initial
    begin
      $dumpfile("Tabla-1-POS_tb.vcd"); // noten que el nombre del archivo siempre es el que incluye el _tb y la extension es .vcd
      $dumpvars(0, Tabla1POS); // noten que el nombre que está después del número 0 es el mismo que el nombre del módulo que estamos probando
    end
endmodule	//finalizar el módulo