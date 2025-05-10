`timescale 1ns/10ps
module four_bit_2x1_mux_tb;
	
    reg [3:0] In_1;     
    reg [3:0] In_0;     
    reg Select;         
    wire [3:0] Out;     

    four_bit_2x1_mux uut (
        .In_1(In_1),
        .In_0(In_0),
        .Select(Select),
        .Out(Out)
    );

    initial begin
        In_1 = 4'b1010; In_0 = 4'b0101; Select = 0; #10;
        In_1 = 4'b1010; In_0 = 4'b0101; Select = 1; #10;
        In_1 = 4'b1111; In_0 = 4'b0000; Select = 0; #10;
        In_1 = 4'b1111; In_0 = 4'b0000; Select = 1; #10;
        In_1 = 4'b0011; In_0 = 4'b1100; Select = 0; #10;
        In_1 = 4'b0011; In_0 = 4'b1100; Select = 1; #10;
        $finish;
    end

endmodule
	

