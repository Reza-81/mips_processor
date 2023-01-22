`timescale 1ns / 1ps

module execute(
	input clk,
	input [31:0] ALUReadData1,
	input [31:0] ALUReadData2,
	input [31:0] immediate,
	input [31:0] pc,
	input [5:0] funct,
	input [2:0] ALUOp,
	input [4:0] rt,
	input [4:0] rd,
	input ALUSrc,
	input rgdst,
	output [31:0] aluresult,
	output zero,
	output [31:0] addresult,
	output [31:0] alureaddata2,
	output [4:0] rd_or_rt
	);
	
	// instantiate the mux
	multiplexer_2x1_32_bit mux_rt_or_rd(
		.s(rgdst),
		.a(rt),
		.b(rd),
		.c(rd_or_rt)
	);
	
	// instantiate the mux
	multiplexer_2x1_32_bit mux_behined_alu (
		.s(ALUSrc),
		.a(ALUReadData2),
		.b(immediate),
		.c()
	);
	
	// Instantiate the alu
	alu alu (
		.alucnt(alu_control_unit.alucnt), 
		.input1(ALUReadData1), 
		.input2(mux_behined_alu.c), 
		.shamt(immediate[10:6]), 
		.result(aluresult), 
		.zero(zero)
		);
	
	// Instantiate the alu_control_unit
	alu_control_unit alu_control_unit (
		.aluop(ALUOp), 
		.funct(funct), 
		.alucnt()
		);
	
	// branch
	assign addresult = pc + (immediate << 2);
	
	assign alureaddata2 = ALUReadData2;


endmodule
