module parameterizable_and #(parameter bus_size = 4) 
	(input logic [bus_size-1:0] a,b, output logic[bus_size-1:0] out);

		assign out = a&b;
	
endmodule
