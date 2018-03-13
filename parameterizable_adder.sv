module parameterizable_adder #(bus_size = 4)
	(input logic[bus_size-1:0] a,b,input logic cin,
	output logic[bus_size-1:0] s,output logic overflow);
	
	
	logic[bus_size-1:0] cout;
	genvar i;
	generate 
	

		for (i = 0; i < bus_size; i = i+1) begin:forloop
			if(i === 0) one_bit_full_adder addr(a[i],b[i],cin, s[i],cout[i+1]);
			else if(i === bus_size-1) one_bit_full_adder addr(a[i],b[i],cout[i], s[i], overflow);
			else one_bit_full_adder addr(a[i],b[i],cout[i], s[i],cout[i+1]);
		end
	
	endgenerate
	
	
endmodule
