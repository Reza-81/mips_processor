`timescale 1ns / 1ps

module alu_control_unit_test;

	// Inputs
	reg [2:0] aluop;
	reg [5:0] funct;

	// Outputs
	wire [3:0] alucnt;

	// Instantiate the Unit Under Test (UUT)
	alu_control_unit uut (
		.aluop(aluop), 
		.funct(funct), 
		.alucnt(alucnt)
	);

	initial begin
		// Initialize Inputs
		aluop = 0;
		funct = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		aluop = 0;
		funct = 1;
		
		#20;
		aluop = 4;
		funct = 1;


	end
      
endmodule

