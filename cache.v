`timescale 1ns / 1ps

module cache(
	input clk, 
	input [31:0]address, 
	input [127:0]dataline,
	output reg [31:0]instruction,
	output reg hit
	);

	// cache
	reg [153:0] cache[0:7];
		
	//initial
	integer i;
	initial begin
		for (i = 0; i < 8; i = i + 1)begin
			cache[i] = 0;
		end
	end
	
	always @(posedge clk)begin
		// if hit
		if (cache[address[6:4]][153] && address[31:7] == cache[address[6:4]][152:128])begin
			hit = 1;
			if (address[3:2] == 0)begin
				instruction = cache[address[6:4]][31:0];
			end
			else if (address[3:2] == 1)begin
				instruction = cache[address[6:4]][63:32];
			end
			else if (address[3:2] == 2)begin
				instruction = cache[address[6:4]][95:64];
			end
			else if (address[3:2] == 3)begin
				instruction = cache[address[6:4]][127:96];
			end
		end
		//miss
		else begin
			hit = 0;
		end
	end
	
	// if miss, update cache
	always @(dataline)begin
		// valid bit
		cache[address[6:4]][153] = 1;
		// dataline
		cache[address[6:4]][127:0] = dataline;
		// tag
		cache[address[6:4]][152:128] = address[31:7];
	end


endmodule
