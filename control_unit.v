`timescale 1ns / 1ps

module control_unite(
	input [5:0] opcode,
	output reg_dst,
	output alu_src,
	output mem_to_reg,
	output reg_write,
	output mem_read,
	output mem_write,
	output branch,
	output [2:0] alu_op
	);

	assign reg_dst = opcode == 6'b000000 ? 1:0;
	
	assign alu_src = opcode == 6'b000000 ? 0:
						  opcode == 6'b000110 ? 0:1;
	
	assign mem_to_reg = opcode == 6'b000100 ? 1:0;
	
	assign reg_write = opcode == 6'b000101 ? 0:
							  opcode == 6'b000110 ? 0:1;
	
	assign mem_read = opcode == 6'b000100 ? 1:0;
	
	assign mem_write = opcode == 6'b000101 ? 1:0;
	
	assign branch = opcode == 6'b000110 ? 1:0;
	
	assign alu_op = opcode == 6'b000000 ? 3'b000:
						 opcode == 6'b000110 ? 3'b001:
						 opcode == 6'b000001 ? 3'b010:011;

endmodule
