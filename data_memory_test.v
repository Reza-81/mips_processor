`timescale 1ns / 1ps

module data_memory_test;

	// Inputs
	reg clk;
	reg [31:0] address;
	reg [31:0] writeData;
	reg MemRead;
	reg MemWrite;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.clk(clk), 
		.address(address), 
		.writeData(writeData), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.readData(readData)
	);
	
	initial begin
	clk = 0;
	end
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		address = 0;
		writeData = 0;
		MemRead = 0;
		MemWrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		address = 0;
		writeData = 10;
		MemRead = 0;
		MemWrite = 1;
		
		#50;
		
		address = 0;
		writeData = 10;
		MemRead = 1;
		MemWrite = 0;

	end
      
endmodule

