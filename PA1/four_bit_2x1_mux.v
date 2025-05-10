module four_bit_2x1_mux(In_1, In_0, Select, Out);
	input [3:0] In_1;
	input [3:0] In_0;
	input Select;
	output [3:0] Out;
	
	wire [3:0] selected_1;
    wire [3:0] selected_0;

    // And gates selection part
    assign selected_1 = {4{Select}} & In_1;   
    assign selected_0 = {4{~Select}} & In_0;

    //Combining with or gates
    assign Out = selected_1 | selected_0;

	
endmodule
