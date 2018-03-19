module simple_mux #(bus_size = 4)
	(input logic[bus_size-1:0] 	a, b,
		input logic 					select,
		output logic[bus_size-1:0] out);

	assign out = select? b : a;

endmodule
