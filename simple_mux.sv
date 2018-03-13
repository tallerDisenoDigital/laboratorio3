module simple_mux(input logic a, b, select, output logic out);

	assign out = select? a: b;

endmodule
