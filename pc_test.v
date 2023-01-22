`timescale 1ns / 1ps

module pc_test;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] data;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.clk(clk), 
		.hit(hit), 
		.data(data), 
		.result(result)
	);
	initial begin
		// Initialize Inputs
		clk = 0;
		hit = 0;
		data = 0;
	end
	always #10 clk = ~clk;
	
	initial begin
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		data = 40;
		#15;
		hit = 1;
		data = 70;

	end
      
endmodule

