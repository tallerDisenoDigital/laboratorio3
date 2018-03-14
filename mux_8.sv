module mux_8 #(bus_size = 4)
	(input logic[bus_size-1:0] a, b,c,d,e,f,g,h, input logic[2:0] select, output logic[bus_size-1:0] out);
	logic[bus_size-1:0] stage_1_1_out;
	logic[bus_size-1:0] stage_1_2_out;
	mux_4 #(bus_size) stage_1_1(a,b,c,d,select[1:0], stage_1_1_out);
	mux_4 #(bus_size) stage_1_2(e,f,g,h,select[1:0], stage_1_2_out);
	simple_mux #(bus_size) stage_2(stage_1_1_out,stage_1_2_out,select[2], out);
endmodule

