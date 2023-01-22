`timescale 1ns / 1ps

module alu_test;

	// Inputs
	reg [3:0] alucnt;
	reg [31:0] input1;
	reg [31:0] input2;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.alucnt(alucnt), 
		.input1(input1), 
		.input2(input2), 
		.shamt(shamt), 
		.result(result), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		alucnt = 0;
		input1 = 0;
		input2 = 0;
		shamt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		alucnt = 8;
		input1 = 0;
		input2 = 0;
		shamt = 0;
		
		#50
		alucnt = 0;
		input1 = 2;
		input2 = 3;
		shamt = 0;
		
		#50
		alucnt = 3;
		input1 = 2;
		input2 = 3;
		shamt = 5;
		

	end
      
endmodule

