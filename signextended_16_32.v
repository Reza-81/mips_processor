`timescale 1ns / 1ps

module signextended_16_32(
	input [15:0] data,
	output [31:0] out
    );
	assign out = {{16{data[15]}}, data};

endmodule
