module machine_jk(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
    wire Ja, Ka, Jb, Kb, Jc, Kc;
    wire A, B, C;

    // State assignments
    assign S = {A, B, C};

    // A JK Flip-Flop inputs
    assign Ja = B | (x & ~C);
    assign Ka = (x & B & ~C) | (~x & B & C);

    // B JK Flip-Flop inputs
    assign Jb = (~A & C) | (A & ~C) | (x & C);
    assign Kb = (x & ~A) | (~x & C);

    // C JK Flip-Flop inputs
    assign Jc = ~x | (~A & ~B);
    assign Kc = ~x | (A & ~B);

    // Instantiate JK Flip-Flops
    jkff ff_A (.J(Ja), .K(Ka), .CLK(CLK), .RESET(RESET), .Q(A));
    jkff ff_B (.J(Jb), .K(Kb), .CLK(CLK), .RESET(RESET), .Q(B));
    jkff ff_C (.J(Jc), .K(Kc), .CLK(CLK), .RESET(RESET), .Q(C));

    // Output F calculation
    assign F = A & B & C;

endmodule