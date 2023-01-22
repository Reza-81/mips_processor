`timescale 1ns / 1ps

module id_ex_register(
	input clk,
	input hit,
	input [31:0] readData1,
	input [31:0] readData2,
	input [31:0] signExImmediate,
	input RegDst,
	input ALUSrc,
	input MemtoReg,
	input RegWrite,
	input MemRead,
	input MemWrite,
	input Branch,
	input [2:0] ALUOp,
	input [4:0] rt,
	input [4:0] rd,
	input [5:0] funct,
	input [31:0] nextPC,
	output reg [31:0] readData1Out = 0,
	output reg [31:0] readData2Out = 0,
	output reg [31:0] signExImmediateOut = 0,
	output reg RegDstOut = 0,
	output reg ALUSrcOut = 0,
	output reg MemtoRegOut = 0,
	output reg RegWriteOut = 0,
	output reg MemReadOut = 0,
	output reg MemWriteOut = 0,
	output reg BranchOut = 0,
	output reg [2:0] ALUOpOut = 0,
	output reg [4:0] rtOut = 0,
	output reg [4:0] rdOut = 0,
	output reg [5:0] functOut = 0,
	output reg [31:0] nextPCOut = 0
	);
	
	always @(negedge clk)begin
		readData1Out = readData1;
		readData2Out = readData2;
		signExImmediateOut = signExImmediate;
		RegDstOut = RegDst;
		ALUSrcOut = ALUSrc;
		MemtoRegOut = MemtoReg;
		RegWriteOut = RegWrite;
		MemReadOut = MemRead;
		MemWriteOut = MemWrite;
		BranchOut = Branch;
		ALUOpOut = ALUOp;
		rtOut = rt;
		rdOut = rd;
		functOut = funct;
		nextPCOut = nextPC;
	 end


endmodule
