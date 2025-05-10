module jkff (
    input J,      // Data input
    input K,      // Data input
    input CLK,    // Clock input
    input RESET,  // Asynchronous reset, active high
    output reg Q  // Output
);
    always @(posedge CLK or posedge RESET) begin
        if (RESET) 
            Q <= 1'b0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;       // No change
                2'b01: Q <= 1'b0;    // Reset
                2'b10: Q <= 1'b1;    // Set
                2'b11: Q <= ~Q;      // Toggle
            endcase
        end
    end
endmodule