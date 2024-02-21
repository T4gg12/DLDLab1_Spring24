module rca4 (input  logic [3:0]a, b, input logic cin, output logic [4:0]Sum);

    logic C_inside [2:0];
 
    fulladder in1 (.a(a[0]), .b(b[0]), .c(cin), .y(Sum[0]), .cout(C_inside[0]));
    fulladder in2 (.a(a[1]), .b(b[1]), .c(C_inside[0]), .y(Sum[1]), .cout(C_inside[1]));
    fulladder in3 (.a(a[2]), .b(b[2]), .c(C_inside[1]), .y(Sum[2]), .cout(C_inside[2]));
    fulladder in4 (.a(a[3]), .b(b[3]), .c(C_inside[2]), .y(Sum[3]), .cout(Sum[4]));

endmodule