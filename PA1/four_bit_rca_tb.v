`timescale 1 ns/10 ps
module four_bit_rca_tb;

    reg [3:0] A, B;    
    reg Cin;            
    wire [3:0] S;      
    wire Cout;          

    four_bit_rca uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin

        // Test case 1
        A = 4'b0000; B = 4'b0000; Cin = 0; 
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 2
        A = 4'b0001; B = 4'b0001; Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 3
        A = 4'b0010; B = 4'b0011; Cin = 1;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 4
        A = 4'b0100; B = 4'b0101; Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 5
        A = 4'b1111; B = 4'b1111; Cin = 1;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 6
        A = 4'b1100; B = 4'b1010; Cin = 1;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 7
        A = 4'b0110; B = 4'b0011; Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 8
        A = 4'b1001; B = 4'b0100; Cin = 1;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 9
        A = 4'b1111; B = 4'b1111; Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 10 - Maximum input values
        A = 4'b1111; B = 4'b0000; Cin = 1;
        #10;
        $display("A = %b, B = %b, Cin = %b => S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Finish the simulation
        $finish;
    end

endmodule