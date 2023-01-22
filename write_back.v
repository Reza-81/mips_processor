`timescale 1ns / 1ps

module write_back(
	input MemtoReg,
	input [31:0] readData,
	input [31:0] ALUResult,
	output reg [31:0] writeData
	);
	
	always @(*) begin 
		if (MemtoReg == 1)
			writeData = readData;
		else
			writeData = ALUResult;
	end

endmodule
