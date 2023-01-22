`timescale 1ns / 1ps

module control_unit_test;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire reg_dst;
	wire alu_src;
	wire mem_to_reg;
	wire reg_write;
	wire mem_read;
	wire mem_write;
	wire branch;
	wire [2:0] alu_op;

	// Instantiate the Unit Under Test (UUT)
	control_unite uut (
		.opcode(opcode), 
		.reg_dst(reg_dst), 
		.alu_src(alu_src), 
		.mem_to_reg(mem_to_reg), 
		.reg_write(reg_write), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.branch(branch), 
		.alu_op(alu_op)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		opcode = 6'b000100;
		
		#10;
		opcode = 6'b000000;

	end
      
endmodule

