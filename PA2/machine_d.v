module machine_d(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
    wire Da, Db, Dc; // Inputs for D flip-flops
    wire A, B, C;    // Outputs of D flip-flops

    // State assignment to output
    assign S = {A, B, C};

    // D flip-flop input equations based on state diagram
    assign Da = (A & ~B) | (~A & B) | (~x & B & ~C) | (x & A & C) | (x & ~B & ~C);
    assign Db = (x & A) | (A & ~C) | (~x & B & ~C) | (~A & ~B & C);
    assign Dc = (~x & ~C) | (x & ~A & ~B) | (x & B & C);

    // Output logic equation
    assign F = ( A & B & C);

    // Instantiate D flip-flops
    dff ff_A (.D(Da), .CLK(CLK), .RESET(RESET), .Q(A));
    dff ff_B (.D(Db), .CLK(CLK), .RESET(RESET), .Q(B));
    dff ff_C (.D(Dc), .CLK(CLK), .RESET(RESET), .Q(C));

endmodule