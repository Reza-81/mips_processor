`timescale 1ns / 1ps

module fetch(
	input clk,
	input pc_source,
	input [31:0] branch_target,
	output hit,
	output [31:0] next_pc,
	output [31:0] instruction
	);
	
	//instantiate the mux
	multiplexer_2x1_32_bit mux (
		.s(pc_source),
		.a(next_pc),
		.b(branch_target),
		.c()
	);
	
	// Instantiate the pc
	pc pc (
		.clk(clk), 
		.hit(hit || pc_source), 
		.data(mux.c), 
		.result()
	);
	
	// Instantiate the instruction memory
	instruction_memory instruction_memory (
		.clk(clk), 
		.address(pc.result-4), 
		.dataline()
	);
	
//	always @(clk) begin
//		$display("%b",instruction_memory.dataline);
//	end
	 
	// Instantiate the cache
	cache cache (
		.clk(clk), 
		.address(pc.result-4), 
		.dataline(instruction_memory.dataline), 
		.instruction(instruction), 
		.hit(hit)
	);
	
	// Instantiate the adder
	adder_32_bit adder (
		.a(pc.result), 
		.b(4), 
		.c(next_pc)
	);

endmodule