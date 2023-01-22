`timescale 1ns / 1ps

module if_id_register(
	input clk,
	input hit,
	input [31:0] next_pc,
	input [31:0] instruction,
	output reg [31:0] instruction_out = 0,
	output reg [31:0] next_pc_out = 0
	);
	
	 always @(negedge clk)begin
		instruction_out = instruction;
		next_pc_out = next_pc;
	 end

endmodule