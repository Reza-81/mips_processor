`timescale 1ns / 1ps

module cache_test;

	// Inputs
	reg clk;
	reg [31:0] address;
	reg [127:0] dataline;

	// Outputs
	wire [31:0] instruction;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	cache uut (
		.clk(clk), 
		.address(address), 
		.dataline(dataline), 
		.instruction(instruction), 
		.hit(hit)
	);

	initial begin
		clk = 0;
	end
	always #10 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		address = 0;
		
		#20;
		dataline = 10;
		
		#20;
		dataline = 0;


	end
      
endmodule

