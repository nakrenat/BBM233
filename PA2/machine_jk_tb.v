`timescale 1ns / 1ps

module machine_jk_tb;
    // Inputs
    reg x;
    reg CLK;
    reg RESET;

    // Outputs
    wire F;
    wire [2:0] S;

    // Instantiate the Unit Under Test (UUT)
    machine_jk uut (
        .x(x), 
        .CLK(CLK), 
        .RESET(RESET), 
        .F(F), 
        .S(S)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // Generate clock signal with a period of 10ns
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        x = 0;
        RESET = 1;

        // Apply reset
        #10;
        RESET = 0;

        // Apply test cases
        #10 x = 1; // Test case 1
        #10 x = 0; // Test case 2
        #10 x = 1; // Test case 3
        #10 x = 0; // Test case 4

        // Additional test cases to verify functionality
        #10 RESET = 1; // Reset again
        #10 RESET = 0;
        #10 x = 1;
        #10 x = 0;

        // End simulation
        #50;
        $stop;
    end

    // Monitor the signals
    initial begin
        $monitor("Time=%0t | x=%b | RESET=%b | F=%b | S=%b", $time, x, RESET, F, S);
    end

endmodule
