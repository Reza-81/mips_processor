`timescale 1ns / 1ps

module register_file_test;

	// Inputs
	reg clk;
	reg regwrite;
	reg [4:0] read_reg_1;
	reg [4:0] read_reg_2;
	reg [4:0] write_reg;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.clk(clk), 
		.regwrite(regwrite), 
		.read_reg_1(read_reg_1), 
		.read_reg_2(read_reg_2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2)
	);
	
	initial begin
		clk = 0;
	end
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		regwrite = 0;
		read_reg_1 = 0;
		read_reg_2 = 0;
		write_reg = 0;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		regwrite = 0;
		read_reg_1 = 0;
		read_reg_2 = 1;
		write_reg = 0;
		write_data = 1;
		#10;
		
		regwrite = 1;
		read_reg_1 = 2;
		read_reg_2 = 1;
		write_reg = 2;
		write_data = 1;
		#10;
		
		regwrite = 1;
		read_reg_1 = 2;
		read_reg_2 = 1;
		write_reg = 2;
		write_data = 1;
		#10;
		
		

	end
      
endmodule

