module fulladder (a,b,c,y,cout);

//Input Logic
input logic a;
input logic b;
input logic c;

//Output Logic
output logic y;
output logic cout;


//Full Adder Logic
assign y = a^b^c;
assign cout = a&b | a&c | b&c;

endmodule