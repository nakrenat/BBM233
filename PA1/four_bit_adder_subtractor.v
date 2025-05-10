module four_bit_adder_subtractor(
    input [3:0] A,          
    input [3:0] B,         
    input subtract,         
    output [3:0] Result,   
    output Cout             
);

    
    wire [3:0] B1, B2, B3, B4;         
    wire carry1, carry2, carry3;       

    
    four_bit_2x1_mux mux0 (
        .In_1(~B),      
        .In_0(B),       
        .Select(subtract), 
        .Out(B1)
    );

    
    full_adder FA0 (
        .A(A[0]), 
        .B(B1[0]), 
        .Cin(subtract),    
        .S(Result[0]), 
        .Cout(carry1)
    );

    full_adder FA1 (
        .A(A[1]), 
        .B(B1[1]), 
        .Cin(carry1), 
        .S(Result[1]), 
        .Cout(carry2)
    );

    full_adder FA2 (
        .A(A[2]), 
        .B(B1[2]), 
        .Cin(carry2), 
        .S(Result[2]), 
        .Cout(carry3)
    );

    full_adder FA3 (
        .A(A[3]), 
        .B(B1[3]), 
        .Cin(carry3), 
        .S(Result[3]), 
        .Cout(Cout)       
    );

endmodule
