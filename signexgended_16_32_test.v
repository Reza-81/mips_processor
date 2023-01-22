`timescale 1ns / 1ps

module signexgended_16_32_test;

	// Inputs
	reg [15:0] data;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	signextended_16_32 uut (
		.data(data), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		data = 55;
		#10;
		
		data = 32768;
		

	end
      
endmodule

