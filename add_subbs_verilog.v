module add_subbs_verilog #(
    parameter N = 8
)(
    input wire [N-1:0] A,
    input wire [N-1:0] B,
    input wire Cin,
    output wire Cout,
    output wire [N-1:0] S
);

wire [N:0] carry; // + 1 bit en carry

genvar i;
generate
    for (i = N-1; i >= 0; i = i-1) begin: adder_gen
        if (i == 0) begin: bit0
           fulladderverilog Bit_0 (.A(A[i]), .B(B[i]), .cin(Cin), .S(S[i]), .cout(carry[i]));
        end else begin: bitn
            fulladderverilog Bit_N (.A(A[i]), .B(B[i]), .cin(carry[i-1]), .S(S[i]), .cout(carry[i]));
        end
    end
endgenerate

assign cout = carry[N]; // MSB de carry a cout
endmodule