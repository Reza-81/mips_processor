`timescale 1ns / 1ps

module register_file(
	input clk,
	input regwrite,
	input [4:0] read_reg_1,
	input [4:0] read_reg_2,
	input [4:0] write_reg,
	input [31:0] write_data,
	output [31:0] read_data_1,
	output [31:0] read_data_2
	);
	
	reg [31:0] registers [0:31];
	
	integer i;
	initial begin
		for (i = 0; i < 32; i = i + 1)
			registers[i] = i;
	end
	
	always @(posedge clk)begin
		if (regwrite == 1)begin
			if (write_reg == 0)
				$display("you can not change $zero register!");
			else 
				registers[write_reg] = write_data;
		end
	end
	
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];

endmodule
