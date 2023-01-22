`timescale 1ns / 1ps

module decode_test;

	// Inputs
	reg clk;
	reg [31:0] instruction;

	// Outputs
	wire [4:0] rt;
	wire [4:0] rd;
	wire [5:0] opcode;
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;
	wire [31:0] sig_nextended_immediate;

	// Instantiate the Unit Under Test (UUT)
	decode uut (
		.clk(clk), 
		.instruction(instruction), 
		.rt(rt), 
		.rd(rd), 
		.opcode(opcode), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2), 
		.sig_nextended_immediate(sig_nextended_immediate)
	);

		initial begin
		clk = 0;
	end
	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		instruction = 0;
		#20;
		
		instruction = 832487445;
		#20;

	end
      
endmodule

