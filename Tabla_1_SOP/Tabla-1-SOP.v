// -----------------------------------
// Fernando José Caceros Morales (19148)
// Basado en: http://www.asic-world.com/verilog/verilog_one_day1.html#Low_level_design
// Tabla 1 SOP 
// -----------------------------------
module Tabla1SOP();	// generar y nombrar un módulo
  

wire NA,NB,NC,P1,P2,P3,P4,P5,S1;

reg A,B,C;	

// podemos utilizar compuertas nativas   

not NotA (NA, A);
not NotB (NB, B);
not NotC (NC, C);

and And1 (P1, NA,NB,NC);
and And2 (P2, NA,B,NC);
and And3 (P3, A,NB,NC);
and And4 (P4, A,NB,C);
and And5 (P5, A,B,C);

or Or1 (S1, P1,P2,P3,P4,P5);		

// initial sirve para definir eventos desde el tiempo t = 0

initial begin	// noten el uso del begin y end
  //monitor nos permite rastrear cambios en las entradas y salidas
  // %b = binario %d = decimal %h = hex  \t = tabulación
  $monitor("%b %b %b | %b", A, B, C, S1);
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
      $dumpfile("Tabla-1-SOP.v"); // noten que el nombre del archivo siempre es el que incluye el _tb y la extension es .vcd
      $dumpvars(0, Tabla1SOP); // noten que el nombre que está después del número 0 es el mismo que el nombre del módulo que estamos probando
    end
endmodule	//finalizar el módulo