`timescale 1 ns/10 ps
module full_adder_tb;

    // Declare signals
    reg A, B, Cin;    
    wire S, Cout;    

    
    full_adder.v uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $monitor("Time: %0t | A = %b | B = %b | Cin = %b | S = %b | Cout = %b", $time, A, B, Cin, S, Cout);  

        A = 0; B = 0; Cin = 0; #10;  // Test input 000
        A = 0; B = 0; Cin = 1; #10;  // Test input 001
        A = 0; B = 1; Cin = 0; #10;  // Test input 010
        A = 0; B = 1; Cin = 1; #10;  // Test input 011
        A = 1; B = 0; Cin = 0; #10;  // Test input 100
        A = 1; B = 0; Cin = 1; #10;  // Test input 101
        A = 1; B = 1; Cin = 0; #10;  // Test input 110
        A = 1; B = 1; Cin = 1; #10;  // Test input 111

        $finish;  
    end


endmodule