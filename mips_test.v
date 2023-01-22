`timescale 1ns / 1ps

module mips_test;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk)
	);
	
	initial begin
	clk = 0;
	end
	always #5 clk = ~clk;
      
endmodule

