module parameterizable_not #(parameter bus_size = 4) (input logic [bus_size -1 : 0] in, output logic[bus_size-1:0] out);

	assign out = ~in;

endmodule
