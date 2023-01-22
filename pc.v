`timescale 1ns / 1ps

module pc(
	input clk,
	input hit,
	input [31 : 0] data,
	output reg [31 : 0] result = 0
	);
	
	reg flag;
	initial begin
		flag = 1;
	end
	
	// load data in to register
	always @(negedge clk)begin
		if (hit || flag && data !== 32'bx)begin
			result = data;
			flag = 0;
		end
	end

endmodule
