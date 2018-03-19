`timescale 1ns / 1ns

module ALUtb #(parameter bus_size = 4, shamt_bus_size=2); 	
	
	logic[bus_size-1:0] a, b;
	logic[2:0]select;
	//para el shamt se usa un valor extra en el logic para que en la simulacion el numero sea sin signo
	logic[shamt_bus_size:0]shamt;
	logic[bus_size-1:0] s;
	logic flag_overflow, flag_zero, flag_negative, flag_carry_out;

	ALU #(bus_size,shamt_bus_size) alu(a, b, select[2:0], shamt[shamt_bus_size:0], s,
													flag_overflow, flag_zero, flag_negative, flag_carry_out);

	//Lista de funciones									
	//000 suma, 001 restador, 010 shift izquierdo, 011 shift derecho
	//100 or, 101 and, 110 xor, 111 not
	
	initial begin	
	
	shamt = 0;
	
	// Suma
	select = 0;
	
	a = 15;
	b = 0;
	#10
	//assert (s===1) $info("=)"); else $error("15 + 0 = 15. Failed");
	
	a = 8;
	b = 4;
	#10;
	
	a = 0;
	b = 15;
	#10
	
	b = 10;
	#10

	// Resta
	select = 1;

	a = 15;
	b = 1;
	#10

	a = 2;
	b = 12;
	#10

	a = 1;
	b = 1;
	#10
	
	a = 15;
	b = 0;
	#10
	
	// Shift left
	select = 2;
	
	a = 8;
	shamt = 2;
	#10

	a = 15;
	shamt = 3;
	#10
	
	a = 8;
	shamt = 1;
	#10
	
	a = 1;
	shamt = 2;
	#10

	// Shift right
	select = 3;
	
	a = 8;
	shamt = 3;
	#10
	
	a = 1;
	shamt = 1;
	#10
	
	a = 4;
	shamt = 2;
	#10
	
	a = 15;
	shamt = 3;
	#10

	// or
	select = 4;
	
	a = 10;
	b = 5;
	#10
	
	a = 0;
	b = 10;
	#10
	
	a = 15;
	b = 0;
	#10
	
	a = 15;
	b = 15;
	#10

	// and
	select = 5;
	
	a = 0;
	b = 0;
	#10
	
	a = 15;
	b = 15;
	#10
	
	a = 10;
	b = 5;
	#10
	
	a = 10;
	b = 1;
	#10
	
	// xor
	select = 6;
	
	a = 5;
	b = 10;
	#10
	
	a = 15;
	b = 15;
	#10
	
	a = 0;
	b = 15;
	#10
	
	a = 0;
	b = 0;
	#10

	// not
	select = 7;
	
	a = 15;
	#10
	
	a = 10;
	#10
	
	a = 5;
	#10
	
	a = 0;
	#10;
	
	end
/*
	logic[7:0] a, b,c,d,e,f,g,h;
	logic[3:0] select;
	logic[7:0] out;
	mux_8 #(8) main(a, b,c,d,e,f,g,h, select[2:0], out);

	initial begin
		a = 0;
		b = 1;
		c = 2;
		d = 3;
		e = 4;
		f = 5;
		g = 6;
		h = 7;
		
		select = 0;
		#10
		select = 1;
		#10
		select = 2;
		#10
		select = 3;
		#10
		select = 4;
		#10
		select = 5;
		#10
		select = 6;
		#10
		select = 7;
		#10;		
	end;
	*/
	
endmodule 