`timescale 1 ns/10 ps

module nbit_adder_tb_verilog();
	//signal declaration
	localparam 	n=4;
	reg[3:0] 	a_tb, b_tb;
	reg	 	cin_tb;
	wire[3:0]	s_tb;
	wire		cout_tb;

	//Instantiate DUT
	nbit_adder # (.N(4)) DUT (	.a(a_tb), .b(b_tb), .cin(cin_tb),
					.s(s_tb), .cout(cout_tb));

	//test signal Generator
	initial
	begin
		//test vector 0
		a_tb	= 4'b0000;
		b_tb	= 4'b0000;
		cin_tb	= 4'b0;
		# 200;

		//test vector 1
		a_tb	= 4'b1000;
		b_tb	= 4'b0001;
		cin_tb	= 4'b0;
		# 200;

		//test vector 2
		a_tb	= 4'b1010;
		b_tb	= 4'b0001;
		cin_tb	= 4'b0;
		# 200;
//test vector 3
		a_tb	= 4'b1111;
		b_tb	= 4'b0001;
		cin_tb	= 4'b0;
		# 200;

		//test vector 4
		a_tb	= 4'b0010;
		b_tb	= 4'b1011;
		cin_tb	= 4'b0;
		# 200;

		//test vector 5
		a_tb	= 4'b0011;
		b_tb	= 4'b1001;
		cin_tb	= 4'b0;
		# 200;

		//test vector 6
		a_tb	= 4'b1100;
		b_tb	= 4'b1000;
		cin_tb	= 4'b0;
		# 200;

		//test vector 7
		a_tb	= 4'b0111;
		b_tb	= 4'b0011;
		cin_tb	= 4'b0;
		# 200;
		
		//test vector 8
		a_tb	= 4'b0001;
		b_tb	= 4'b0000;
		cin_tb	= 4'b0;
		//stop simulation
		$stop;
	end
endmodule