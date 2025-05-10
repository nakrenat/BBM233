`timescale 1ns/1ps
module four_bit_adder_subtractor_tb;

    reg [3:0] A, B;    
    reg subtract;       
    wire [3:0] Result; 
    wire Cout;          

    
    four_bit_adder_subtractor uut (
        .A(A),
        .B(B),
        .subtract(subtract),
        .Result(Result),
        .Cout(Cout)
    );

    
    initial begin
        
        $monitor("Time = %0d | A = %b, B = %b, subtract = %b | Result = %b, Cout = %b", $time, A, B, subtract, Result, Cout);

        

        // Test addition 0
        A = 4'b0000; B = 4'b0000; subtract = 0; #10;
        A = 4'b0001; B = 4'b0001; subtract = 0; #10;
        A = 4'b0010; B = 4'b0011; subtract = 0; #10;
        A = 4'b0100; B = 4'b0101; subtract = 0; #10;
        A = 4'b1111; B = 4'b1111; subtract = 0; #10;

        // Test subtraction 1
        A = 4'b0000; B = 4'b0000; subtract = 1; #10;
        A = 4'b0001; B = 4'b0001; subtract = 1; #10;
        A = 4'b0010; B = 4'b0011; subtract = 1; #10;
        A = 4'b0100; B = 4'b0101; subtract = 1; #10;
        A = 4'b1111; B = 4'b1111; subtract = 1; #10;

        
        A = 4'b1111; B = 4'b0000; subtract = 1; #10; 
        A = 4'b0000; B = 4'b1111; subtract = 1; #10; 

        
        $finish;
    end

    
endmodule
