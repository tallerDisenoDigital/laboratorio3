module register #(parameter bus_size = 4) 
	(input logic  [bus_size-1:0] data, input logic  reset, input logic   clk, output logic[bus_size-1:0] out);
		always @(posedge clk or posedge reset)
		if (reset)
			out = 0;
		else if (clk == 1)
			out = data;
endmodule 