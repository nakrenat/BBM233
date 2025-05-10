`timescale 1ns/10ps
module two_s_complement_tb;

   // Input and output signals
    reg [3:0] In;      
    wire [3:0] Out;    

    two_s_complement uut (
        .In(In), 
        .Out(Out)
    );

    initial begin
        $monitor("Time: %0t | In = %b | Out = %b", $time, In, Out); // Examine the changes of the signals

        // Test all inputs
        In = 4'b0000; #10;  // Test input 0
        In = 4'b0001; #10;  // Test input 1
        In = 4'b0010; #10;  // Test input 2
        In = 4'b0011; #10;  // Test input 3
        In = 4'b0100; #10;  // Test input 4
        In = 4'b0101; #10;  // Test input 5
        In = 4'b0110; #10;  // Test input 6
        In = 4'b0111; #10;  // Test input 7
        In = 4'b1000; #10;  // Test input 8
        In = 4'b1001; #10;  // Test input 9
        In = 4'b1010; #10;  // Test input 10
        In = 4'b1011; #10;  // Test input 11
        In = 4'b1100; #10;  // Test input 12
        In = 4'b1101; #10;  // Test input 13
        In = 4'b1110; #10;  // Test input 14
        In = 4'b1111; #10;  // Test input 15

        $finish; 
    end

endmodule 
