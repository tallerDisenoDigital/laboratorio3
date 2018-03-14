
//Note que 2^shamt_p tiene que ser igual a bus_size, se delega esta responsabilidad a la persona que instancie
//el modulo
module ALU #(parameter bus_size = 8, shamt_p = 3) (input logic[bus_size-1:0] a, b, input logic[2:0]select, input logic[shamt_p-1:0]shamt, 
											output logic[bus_size-1:0] s, output logic flag_overflow, flag_zero, 
											flag_negative, flag_carry_out);
											
		//Lista de funciones									
		//000 suma, 001 restador, 010 shift izquierdo, 011 shift derecho
		//100 or, 101 and, 110 xor, 111 not
		
		logic[bus_size-1:0] sumador, restador, shift_izquierdo, shift_derecho,my_or,my_and,my_xor,my_not,c2_out;
		//cout es el carry de entrada que se define en el bloque de complemento a 2
		logic cout;
		//enable activa o desactiva el bloque de complemento a 2
		logic enable;
		//Salida parcial del bloque sumador.
		logic carryout;
		//suma_o_resta verifica si la funcion insertada es una suma o una resta
		logic suma_o_resta;
		//esto se define para las dos primeras patillas del mux.
		assign sumador = restador;
		//flag_zero está en alto si todos los bits de s son cero.
		assign flag_zero = &(~s);
		//Enable (activa el bloque complemento a 2) se activa cuando la funcion es resta.
		assign enable = ~select[2]&~select[1]&select[0];
		//se activa en 1 si el bit mas significativo es 1
		assign flag_negative = s[bus_size-1];
		
		//Suma o resta esta en activo si los dos bits mas significativos del selector son ceros
		assign suma_o_resta = ~select[2]&~select[1];
		
		//flag_carry_out esta en alto cuando la operacione es suma o resta y el carryout esta definido
		assign flag_carry_out = suma_o_resta & carryout;
		
		//overflow es verdadero si hay un cambio de signo en la en el resultado
		//por favor verificar que esta bandera funcione
		assign flag_overflow = ~(a[bus_size-1]^b[bus_size-1]^suma_o_resta) & suma_o_resta & (sumador[bus_size-1] ^ a[bus_size-1]) ;
		
		
		//definicion de las funciones logicas
		parameterizable_or  #(bus_size) _or (a,b,my_or);
		parameterizable_and #(bus_size) _and(a,b,my_and);
		//not aplica solo sobre la entrada a
		parameterizable_not #(bus_size) _not(a,my_not);
		parameterizable_xor #(bus_size) _xor(a,b,my_xor);
		
		// definiciones de la funciones aritmeticas
		// el bloque complemento 2: note que cout se conecta con el cin del adder para sumarle 1 ya que el complemento a 2
		// realiza la negacion de la entrada
		parameterizable_2_complement #(bus_size) (b, enable, c2_out,cout);
		parameterizable_adder #(bus_size) sum(a, c2_out, cout, sumador, carryout);
		
		 
		//definicion de las funciones shift 
		
		
		parameterizable_shift_left  #(bus_size,shamt_p) shift_l(a, shamt, shift_izquierdo);
		parameterizable_shift_right  #(bus_size,shamt_p) shift_r(a, shamt, shift_right);
		
		//asignacion de las entradas del mux
		
		mux_8 #(bus_size) my_selector(sumador, restador, shift_izquierdo, shift_derecho,my_or,my_and,my_xor,my_not,select,s);
		
endmodule
