module killme ();
    logic [3:0] A,B;
    logic Cin;
    logic [4:0] Sum;
    logic [4:0] Sum_correct;

    logic clk;
    logic [31:0] errors;
    logic [31:0] vectornum;
    
    integer handle3;
    integer desc3;
    integer i,j,k;

    rca4 dut1 (A,B,Cin,Sum);
    assign Sum_correct = A + B + Cin;

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        handle3 = $fopen("rca4.out");
        vectornum = 0;
        errors = 0;
        desc3 = handle3;
    end

    initial begin
        for(j=0; j<150; j=j+1)
                begin 
                        @(posedge clk)
                            begin 
                                A = $random;
                                B = $random;
                                Cin = $random;
                            end
                            @(negedge clk)
                            begin
                                vectornum = vectornum + 1;
                                if (Sum != Sum_correct)
                                    begin errors = errors + 1;
                                        $display("Error: %h %h || %h != %h", A, B, Cin, Sum, Sum_correct);
                                    end
                                #0 $fdisplay(desc3, "%h %h %b || %h || %h || %b", A, B, Cin, Sum, Sum_correct, (Sum == Sum_correct));
                            end
                            
                end
            $display("%d tests completed with %d errors", vectornum, errors);
    end

endmodule