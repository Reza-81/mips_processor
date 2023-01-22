`timescale 1ns / 1ps

module alu_control_unit(
	input [2:0] aluop,
	input [5:0] funct,
	output [3:0] alucnt
	);

	assign alucnt = aluop == 3'b001 ? 4'b0001 :
						 aluop == 3'b010 ? 4'b0111 :
						 aluop == 3'b011 ? 4'b0000 :
						 aluop == 3'b000 ?
						 funct == 6'b000000 ? 4'b0000 :
						 funct == 6'b000001 ? 4'b0001 :
						 funct == 6'b000010 ? 4'b0101 :
						 funct == 6'b000011 ? 4'b0110 :
						 funct == 6'b000100 ? 4'b0111 :
						 funct == 6'b000101 ? 4'b0011 :
						 funct == 6'b000110 ? 4'b0100 :
						 funct == 6'b000111 ? 4'b0010 : 4'bxxxx : 4'bxxxx;


endmodule
