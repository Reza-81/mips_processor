`timescale 1ns / 1ps

module data_memory(
	input clk,
	input [31:0] address,
	input [31:0] writeData,
	input MemRead,
	input MemWrite,
	output reg [31:0] readData
	);

	reg [7:0] memory [0:1023];
	
	integer i;
	initial
		begin
			for(i = 0;i<=1023;i = i+1)
				memory[i] = i;
		end
	
	always @ (posedge clk)
		begin
			if (MemRead)
				begin
					readData = {memory[address+3], memory[address+2], memory[address+1], memory[address]};
				end
			if (MemWrite) 
				begin
					memory[address]   = writeData[7:0];
					memory[address+1] = writeData[15:8];
					memory[address+2] = writeData[23:16];
					memory[address+3] = writeData[31:24];
				end	
		end


endmodule
