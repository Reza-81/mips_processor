`timescale 1ns / 1ps

module write_back_test;

	// Inputs
	reg MemtoReg;
	reg [31:0] readData;
	reg [31:0] ALUResult;

	// Outputs
	wire [31:0] writeData;

	// Instantiate the Unit Under Test (UUT)
	write_back uut (
		.MemtoReg(MemtoReg), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeData(writeData)
	);

	initial begin
		// Initialize Inputs
		MemtoReg = 0;
		readData = 1;
		ALUResult = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		MemtoReg = 1;
		readData = 1;
		ALUResult = 0;

	end
      
endmodule

