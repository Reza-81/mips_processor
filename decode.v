`timescale 1ns / 1ps

module decode(
	input clk,
	input [31:0] instruction,
	input reg_write,
	input [4:0] write_reg,
	input [31:0] write_data,
	output [4:0] rt,
	output [4:0] rd,
	output [5:0] opcode,
	output [31:0] read_data_1,
	output [31:0] read_data_2,
	output [31:0] sig_nextended_immediate
	);
	
	// register file
	register_file register_file (
    .clk(clk), 
    .regwrite(reg_write), 
    .read_reg_1(instruction[25:21]), 
    .read_reg_2(instruction[20:16]), 
    .write_reg(write_reg), 
    .write_data(write_data), 
    .read_data_1(read_data_1), 
    .read_data_2(read_data_2)
    );
	
	// sign extended
	signextended_16_32 signextended_16_32 (
    .data(instruction[15:0]), 
    .out(sig_nextended_immediate)
    );
	
	assign rt = instruction[20:16];
	assign rd = instruction[15:11];
	assign opcode = instruction[31:26];
	
endmodule
