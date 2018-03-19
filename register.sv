module register #(parameter bus_size = 4, shamt_bus_size=2)
	(input logic [bus_size-1:0]	data1,data2,
		input logic [2:0] 			selector,
		input logic [shamt_bus_size:0] shift,
		input logic  					reset,
		input logic   					clk,
		output logic[bus_size-1:0] out);
		
	logic[bus_size-1:0] a, b;
	logic[2:0]select;
	//para el shamt se usa un valor extra en el logic para que en la simulacion el numero sea sin signo
	logic[shamt_bus_size:0]shamt;
	logic[bus_size-1:0] s;
	logic flag_overflow, flag_zero, flag_negative, flag_carry_out;
		
	ALU #(bus_size,shamt_bus_size) alu(a, b, select[2:0], shamt[shamt_bus_size:0], s,
													flag_overflow, flag_zero, flag_negative, flag_carry_out);
		
	always_ff @(posedge clk or posedge reset)
	
	if (reset)
		out <= 0;
	else if (clk == 1) begin
		select <= selector;
		a <= data1;
		b <= data2;
		shamt <= shift;
		
		out <= s;
	end
			
endmodule 