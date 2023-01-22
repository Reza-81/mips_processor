`timescale 1ns / 1ps

module multiplexer_2x1_32_bit_test;

	// Inputs
	reg s;
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] c;

	// Instantiate the Unit Under Test (UUT)
	multiplexer_2x1_32_bit uut (
		.s(s), 
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
//		s = 0;
//		a = 0;
//		b = 0;

		// Wait 100 ns for global reset to finish
//		#100;
        
		// Add stimulus here
		
//		s = 1;
//		a = 10;
//		b = 20;
//		
//		#30;
//		
//		s = 0;
		

	end
      
endmodule

