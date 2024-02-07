module fulladderverilog (
    input A,
    input B,
    input cin,
    output S,
    output cout
);

assign S = A ^ B ^ cin;
assign cout = (A & B) | (A & cin) | (B & cin);

endmodule



