module four_bit_rca(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);

    wire carry1, carry2, carry3;
    
    full_adder FA0 (
        .A(A[0]), 
        .B(B[0]), 
        .Cin(Cin), 
        .S(S[0]), 
        .Cout(carry1)
    );

    full_adder FA1 (
        .A(A[1]), 
        .B(B[1]), 
        .Cin(carry1), 
        .S(S[1]), 
        .Cout(carry2)
    );

    full_adder FA2 (
        .A(A[2]), 
        .B(B[2]), 
        .Cin(carry2), 
        .S(S[2]), 
        .Cout(carry3)
    );

    full_adder FA3 (
        .A(A[3]), 
        .B(B[3]), 
        .Cin(carry3), 
        .S(S[3]), 
        .Cout(Cout)
    );


endmodule