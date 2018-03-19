module parameterizable_2_complement #(parameter bus_size = 4) 
	(input logic[bus_size-1:0] 	in,
		input logic 					enable,
		output logic[bus_size-1:0] out,
		output logic 					cout);
	
	logic[bus_size-1:0] enable_virtual;
	
	genvar i;
	generate
		for (i = 0; i < bus_size; i = i+1) begin:forloop
			assign enable_virtual[i] = enable;
		end
	endgenerate
	
	parameterizable_xor #(bus_size) myxor(enable_virtual,in,out);
	assign cout = enable;

endmodule
