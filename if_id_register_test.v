`timescale 1ns / 1ps

module if_id_register_test;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] next_pc;
	reg [31:0] instruction;

	// Outputs
	wire [31:0] instruction_out;
	wire [31:0] next_pc_out;

	// Instantiate the Unit Under Test (UUT)
	if_id_register uut (
		.clk(clk), 
		.hit(hit), 
		.next_pc(next_pc), 
		.instruction(instruction), 
		.instruction_out(instruction_out), 
		.next_pc_out(next_pc_out)
	);
	
	initial begin
		clk = 0;
	end
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		hit = 0;
		next_pc = 0;
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
		next_pc = 1;
		instruction = 2;
		
		#20;
		next_pc = 3;
		instruction = 4;
        
		// Add stimulus here

	end
      
endmodule

