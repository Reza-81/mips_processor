`timescale 1ns / 1ps

module alu(
	input [3:0] alucnt,
	input [31:0] input1,
	input [31:0] input2,
	input [4:0] shamt,
	output [31:0] result,
	output zero
	);
	
	assign result = alucnt == 4'b0000 ? input1 + input2 :
						 alucnt == 4'b0001 ? input1 - input2 :
						 alucnt == 4'b0010 ? ~input1 :
						 alucnt == 4'b0011 ? input1 << shamt :
						 alucnt == 4'b0100 ? input1 >> shamt :
						 alucnt == 4'b0101 ? input1 & input2 :
						 alucnt == 4'b0110 ? input1 | input2 :
						 alucnt == 4'b0111 ? input1 < input2 ? 1 : 0 : {32{1'bx}};
	assign zero = result == 1'b0 ? 1 : 0;

endmodule
