module parameterizable_shift_right #(bus_size = 4,shamt = 2)
	(input logic[bus_size-1:0] in, input logic[shamt-1:0] shift, output logic[bus_size-1:0] out);
	
	assign out = in >> shift;
	
	
endmodule
