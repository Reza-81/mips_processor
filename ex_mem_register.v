`timescale 1ns / 1ps

module ex_mem_register(
	input clk,
	input hit,
	input [31:0] branchTarget,
	input zeroFlag,
	input [31:0] ALUResult,
	input [31:0] readData2,
	input [4:0] writeReg,
	input MemRead,
	input MemWrite,
	input Branch,
	input RegWrite,
	input MemToReg,
	output reg [31:0] branchTargetOut = 0,
	output reg zeroFlagOut = 0,
	output reg [31:0] ALUResultOut = 0,
	output reg [31:0] readData2Out = 0,
	output reg [4:0] writeRegOut = 0,
	output reg MemReadOut = 0,
	output reg MemWriteOut = 0,
	output reg BranchOut = 0,
	output reg RegWriteOut = 0,
	output reg MemToRegOut = 0,
	output reg hitOut = 0
	);

	always @(negedge clk)begin 
		branchTargetOut = branchTarget;
		zeroFlagOut = zeroFlag;
		ALUResultOut = ALUResult;
		readData2Out = readData2;
		writeRegOut = writeReg;
		MemReadOut = MemRead;
		MemWriteOut = MemWrite;
		BranchOut = Branch;
		RegWriteOut = RegWrite;
		MemToRegOut = MemToReg;
		hitOut = hit;
	end

endmodule
