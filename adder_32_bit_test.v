`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:40:49 11/02/2022
// Design Name:   adder_32_bit
// Module Name:   E:/architect-lab/mips/adder_32_bit_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder_32_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_32_bit_test;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] c;

	// Instantiate the Unit Under Test (UUT)
	adder_32_bit uut (
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 20;
		b = 30;

	end
      
endmodule

