`timescale 1ns / 1ps

module instruction_memory_test;

	// Inputs
	reg clk;
	reg [31:0] address;

	// Outputs
	wire [127:0] dataline;

	// Instantiate the Unit Under Test (UUT)
	instruction_memory uut (
		.clk(clk), 
		.address(address), 
		.dataline(dataline)
	);
	initial begin
		clk = 0;
	end
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		address = 0;
        
		#74;
		
		address = 16;
		
		#100;
		
		address = 32;

	end
      
endmodule

