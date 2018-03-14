module ALUtb();

	logic[7:0] a, b;
	logic[3:0]select;
	//para el shamt se usa un valor extra en el logic para que en la simulacion el numero sea sin signo
	logic[3:0]shamt;
	logic[7:0] s;
	logic flag_overflow, flag_zero, flag_negative, flag_carry_out;

	ALU #(8,3) alu(a, b, select[2:0], shamt[2:0], s, flag_overflow, flag_zero, flag_negative, flag_carry_out);

	//Lista de funciones									
	//000 suma, 001 restador, 010 shift izquierdo, 011 shift derecho
	//100 or, 101 and, 110 xor, 111 not
	
	initial begin
	select = 0;
	//Suma
	
	a = 8;
	b = 4;
	shamt = 0;
	#10
	
	a = 8;
	b = 54;
	#10
	
	
	a = 8;
	b = 41;
	#10
	
	b = 42;
	#10
	
	b = 40;
	#10
	
	b = 39;
	#10
	
	
	
	select = 1;
	//Resta
	#10
	
	a = 50;
	b = 25;
	#10
	
	
	a = 38;
	b = 12;
	#10
	
	
	a = 84;
	b = 124;
	#10
	
	select = 2;
	//Shift left
	a = 8;
	shamt = 2;
	#10
	
	a = 125;
	shamt = 5;
	#10
	
	a = 74;
	shamt = 4;
	#10
	
	select = 3;
	//Shift right
	a = 8;
	shamt = 2;
	#10
	
	a = 125;
	shamt = 5;
	#10
	
	a = 74;
	shamt = 4;
	#10
	
	a = -84;
	shamt = 3;
	#10
	
	
	
	select = 4;
	//or
	a = 57;
	b = 84;
	#10
	
	a = 31;
	b = 14;
	#10
	
	
	select = 5;
	//and
	
	a = 124;
	b = 48;
	#10
	
	a = 74;
	b = 99;
	#10
	
	
	select = 6;
	//xor
	a = 76;
	b = 48;
	#10
	
	a = 85;
	b = 11;
	#10
	
	select = 7;
	//not
	a = 74;
	#10
	
	a = 111;
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

