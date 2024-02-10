module Aritmetic
#(parameter N = 8)
(
    input wire [1:0] Sel,
    input wire Cin,
    input wire [N-1:0] A,
    input wire [N-1:0] B,
    output reg [N-1:0] Result,
    output reg Cout
);

wire [N-1:0] Holding_00_Result,Holding_01_Result,Holding_10_Result,Holding_11_Result;
wire Cout_Holder00,Cout_Holder01,Cout_Holder10,Cout_Holder11;

add_subbs_verilog Mux_00_Result (.A(A), .B(B), .Cin(Cin), .addn_subs(0), .Cout(Cout_Holder00), .S(Holding_00_Result));
add_subbs_verilog Mux_01_Result (.A(A), .B(B), .Cin(Cin), .addn_subs(1), .Cout(Cout_Holder01), .S(Holding_01_Result));
add_subbs_verilog Mux_10_Result (.A("00000000"), .B(DataB), .Cin(Cin), .addn_subs(1), .Cout(Cout_Holder10), .S(Holding_10_Result));
add_subbs_verilog Mux_11_Result (.A("00000001"), .B(DataB), .Cin(Cin), .addn_subs(0), .Cout(Cout_Holder11), .S(Holding_11_Result));

always @* begin
    case (Sel)
        2'b00: Result = Holding_00_Result;  // Si Sel es 00
        2'b01: Result = Holding_01_Result;  // Si Sel es 01
        2'b10: Result = Holding_10_Result;  // Si Sel es 10
        default: Result = Holding_11_Result;  // Si Sel es 11
    endcase
end

always @* begin
    case (Sel)
        2'b00: Cout = Cout_Holder00;  // Si Sel es 00
        2'b01: Cout = Cout_Holder01;  // Si Sel es 01
        2'b10: Cout = Cout_Holder10;  // Si Sel es 10
        default: Cout = Cout_Holder11;  // Si Sel es 11
    endcase
end

endmodule