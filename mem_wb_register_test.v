`timescale 1ns / 1ps

module mem_wb_register_test;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] readData;
	reg [31:0] ALUResult;
	reg [4:0] writeReg;
	reg RegWrite;
	reg MemtoReg;

	// Outputs
	wire hitOut;
	wire [31:0] readDataOut;
	wire [31:0] ALUResultOut;
	wire [4:0] writeRegOut;
	wire RegWriteOut;
	wire [31:0] MemtoRegOut;

	// Instantiate the Unit Under Test (UUT)
	mem_wb_register uut (
		.clk(clk), 
		.hit(hit), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeReg(writeReg), 
		.RegWrite(RegWrite), 
		.MemtoReg(MemtoReg), 
		.hitOut(hitOut), 
		.readDataOut(readDataOut), 
		.ALUResultOut(ALUResultOut), 
		.writeRegOut(writeRegOut), 
		.RegWriteOut(RegWriteOut), 
		.MemtoRegOut(MemtoRegOut)
	);

	initial begin
	clk = 0;
	end
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		hit = 0;
		readData = 0;
		ALUResult = 0;
		writeReg = 0;
		RegWrite = 0;
		MemtoReg = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		hit = 1;
		readData = 10;
		ALUResult = 15;
		writeReg = 3;
		RegWrite = 0;
		MemtoReg = 0;

	end
      
endmodule

