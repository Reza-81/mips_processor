`timescale 1ns / 1ps

module fetch_test;

	// Inputs
	reg clk;
	reg pc_source;
	reg [31:0] branch_target;

	// Outputs
	wire hit;
	wire [31:0] next_pc;
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	fetch uut (
		.clk(clk),
		.pc_source(pc_source), 
		.branch_target(branch_target), 
		.hit(hit), 
		.next_pc(next_pc), 
		.instruction(instruction)
	);
	
	initial begin
		clk = 0;
	end
	always #10 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		pc_source = 1;
		branch_target = 0;

		// Wait 100 ns for global reset to finish
		#20;
      
		// Add stimulus here
		pc_source = 0;

	end
      
endmodule

