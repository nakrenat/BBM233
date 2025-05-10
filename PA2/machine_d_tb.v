`timescale 1ns / 1ps

module machine_d_tb;
    // Inputs
    reg x;
    reg CLK;
    reg RESET;

    // Outputs
    wire F;
    wire [2:0] S;

    // Instantiate the machine_d module
    machine_d uut (
        .x(x),
        .CLK(CLK),
        .RESET(RESET),
        .F(F),
        .S(S)
    );

    // Clock generation
    always begin
        #5 CLK = ~CLK; // Toggle clock every 5 ns
    end

    // Test sequence
    initial begin
        // Initialize inputs
        CLK = 0;
        RESET = 1;
        x = 0;

        // Apply reset
        #10 RESET = 0;

        // Test 1: Apply x = 0
        #10 x = 0;

        // Test 2: Apply x = 1
        #10 x = 1;

        // Test 3: Apply a sequence of x values
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;

        // End simulation
        #50 $stop;
    end

    // Monitor signals for debugging
    initial begin
        $monitor("Time = %0t | x = %b | RESET = %b | F = %b | S = %b", $time, x, RESET, F, S);
    end

endmodule