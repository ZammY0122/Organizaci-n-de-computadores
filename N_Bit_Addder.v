module N_Bit_Addder 
	#(parameter N = 8)
	(	input 	wire[N-1:0] A,
		input 	wire[N-1:0] B,
		input	wire 		   cin,
		output	wire[N-1:0] sum,
		output	wire		   cout);
	wire [N-1:0] carry;
	
	genvar i;
	generate
		for (i = N-1; i >= 0; i = i-1) begin :addder_gem
			if (i == 0) begin: bit0
				fulladderverilog Bit_0 (.A(A[i]),.B(B[i]),.cin(cin),
												.S(sum[i]), .cout(carry[i]));
			end else begin: bitn
				 fulladderverilog Bit_N (.A(A[i]),.B(B[i]),.cin(carry[i-1]),
												.S(sum[i]), .cout(carry[i]));
			end
		end
	endgenerate
	
	assign cout = carry[N-1];
endmodule
