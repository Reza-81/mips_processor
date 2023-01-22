`timescale 1ns / 1ps

module execute_test;

	// Inputs
	reg clk;
	reg [31:0] ALUReadData1;
	reg [31:0] ALUReadData2;
	reg [31:0] immediate;
	reg [31:0] pc;
	reg [5:0] funct;
	reg [2:0] ALUOp;
	reg [4:0] rt;
	reg [4:0] rd;
	reg ALUSrc;
	reg rgdst;

	// Outputs
	wire [31:0] aluresult;
	wire zero;
	wire [31:0] addresult;
	wire [31:0] alureaddata2;
	wire [4:0] rd_or_rt;

	// Instantiate the Unit Under Test (UUT)
	execute uut (
		.clk(clk), 
		.ALUReadData1(ALUReadData1), 
		.ALUReadData2(ALUReadData2), 
		.immediate(immediate), 
		.pc(pc), 
		.funct(funct), 
		.ALUOp(ALUOp), 
		.rt(rt), 
		.rd(rd), 
		.ALUSrc(ALUSrc), 
		.rgdst(rgdst), 
		.aluresult(aluresult), 
		.zero(zero), 
		.addresult(addresult), 
		.alureaddata2(alureaddata2), 
		.rd_or_rt(rd_or_rt)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ALUReadData1 = 0;
		ALUReadData2 = 0;
		immediate = 0;
		pc = 0;
		funct = 0;
		ALUOp = 0;
		rt = 0;
		rd = 0;
		ALUSrc = 0;
		rgdst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		ALUReadData1 = 5;
		ALUReadData2 = 3;
		immediate = 10;
		pc = 0;
		funct = 0;
		ALUOp = 0;
		rt = 0;
		rd = 0;
		ALUSrc = 0;
		rgdst = 0;

	end
      
endmodule

