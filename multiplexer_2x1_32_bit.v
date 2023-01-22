`timescale 1ns / 1ps

module multiplexer_2x1_32_bit(input s, input [31 : 0] a, input [31 : 0] b, output [31 : 0] c);
	
	//s=0 -> a, s=1 -> b 
	assign c = (a & {32{~s}}) | (b & {32{s}});
	
endmodule