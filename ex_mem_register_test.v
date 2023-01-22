`timescale 1ns / 1ps

module ex_mem_register_test;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] branchTarget;
	reg zeroFlag;
	reg [31:0] ALUResult;
	reg [31:0] readData2;
	reg [4:0] writeReg;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg RegWrite;
	reg MemToReg;

	// Outputs
	wire [31:0] branchTargetOut;
	wire zeroFlagOut;
	wire [31:0] ALUResultOut;
	wire [31:0] readData2Out;
	wire [4:0] writeRegOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire BranchOut;
	wire RegWriteOut;
	wire MemToRegOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	ex_mem_register uut (
		.clk(clk), 
		.hit(hit), 
		.branchTarget(branchTarget), 
		.zeroFlag(zeroFlag), 
		.ALUResult(ALUResult), 
		.readData2(readData2), 
		.writeReg(writeReg), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.branchTargetOut(branchTargetOut), 
		.zeroFlagOut(zeroFlagOut), 
		.ALUResultOut(ALUResultOut), 
		.readData2Out(readData2Out), 
		.writeRegOut(writeRegOut), 
		.MemReadOut(MemReadOut), 
		.MemWriteOut(MemWriteOut), 
		.BranchOut(BranchOut), 
		.RegWriteOut(RegWriteOut), 
		.MemToRegOut(MemToRegOut), 
		.hitOut(hitOut)
	);
	
	initial begin
	clk = 0;
	end
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		hit = 0;
		branchTarget = 0;
		zeroFlag = 0;
		ALUResult = 0;
		readData2 = 0;
		writeReg = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		RegWrite = 0;
		MemToReg = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		hit = 1;
		branchTarget = 1;
		zeroFlag = 0;
		ALUResult = 5;
		readData2 = 3;
		writeReg = 1;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		RegWrite = 0;
		MemToReg = 0;

	end
      
endmodule

