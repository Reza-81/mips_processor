`timescale 1ns / 1ps

module mem_wb_register(
	input clk,
	input hit,
	input [31:0] readData,
	input [31:0] ALUResult,
	input [4:0] writeReg,
	input RegWrite,
	input MemtoReg,
	output reg hitOut = 0,
	output reg [31:0] readDataOut = 0,
	output reg [31:0] ALUResultOut = 0,
	output reg [4:0] writeRegOut = 0,
	output reg RegWriteOut = 0,
	output reg [31:0] MemtoRegOut = 0
	);
	
	always @(negedge clk)begin 
		hitOut = hit;
		readDataOut = readData;
		ALUResultOut = ALUResult;
		writeRegOut = writeReg;
		RegWriteOut = RegWrite;
		MemtoRegOut = MemtoReg;
	end

endmodule
