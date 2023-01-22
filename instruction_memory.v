`timescale 1ns / 1ps

module instruction_memory(
	input clk,  
	input [31:0] address, 
	output reg [127:0] dataline);

	// counter
	reg [2:0] counter;
	
	// memory
	reg [7:0] memory[0:512];
	
	// initial memory
	integer i;
	initial begin
		counter = 0;
		memory[0] = 'h00; //add $1, $2, $3
		memory[1] = 'h08;
		memory[2] = 'h43;
		memory[3] = 'h00;
		
		memory[4] = 'h01; //sub $4, $5, $6
		memory[5] = 'h20;
		memory[6] = 'hA6;
		memory[7] = 'h00;
		
		memory[8] = 'h02; //and $7, $8, $9
		memory[9] = 'h38;
		memory[10] = 'h09;
		memory[11] = 'h01;
		
		memory[12] = 'h03; //or $10, $11, $12
		memory[13] = 'h50;
		memory[14] = 'h6C;
		memory[15] = 'h01;
		
		memory[16] = 'h04; //slt $13, $14, $15
		memory[17] = 'h68;
		memory[18] = 'hCF;
		memory[19] = 'h01;
		
		memory[20] = 'h07; //not $16, $17
		memory[21] = 'h80;
		memory[22] = 'h20;
		memory[23] = 'h02;
		
		memory[24] = 'h04; //sw $18, 4($19)
		memory[25] = 'h00;
		memory[26] = 'h72;
		memory[27] = 'h16;
		
		memory[28] = 'h15; //addi $20, $21, 21
		memory[29] = 'h00;
		memory[30] = 'hB4;
		memory[31] = 'h1E;
		
		memory[32] = 'h17; //slti $22, $23, 23
		memory[33] = 'h00;
		memory[34] = 'hF6;
		memory[35] = 'h06;
		
		memory[36] = 'hC5; //lsl $24, $25, 3
		memory[37] = 'hC0;
		memory[38] = 'h20;
		memory[39] = 'h03;
		
		memory[40] = 'hC6; //lsr $26, $27, 3
		memory[41] = 'hD0;
		memory[42] = 'h60;
		memory[43] = 'h03;
		
		memory[44] = 'h04; //lw $18, 4($19)
		memory[45] = 'h00;
		memory[46] = 'h72;
		memory[47] = 'h12;
		
		memory[48] = 'hF3; //beq $0, $0, -13
		memory[49] = 'hFF;
		memory[50] = 'h00;
		memory[51] = 'h18;
	end
	
	// return dataline from memory
	always @(posedge clk)begin
		if (counter == 4)begin
			dataline = {memory[address+15], memory[address+14], memory[address+13], memory[address+12]
										 ,memory[address+11], memory[address+10], memory[address+9], memory[address+8]
										 ,memory[address+7], memory[address+6], memory[address+5], memory[address+4]
										 ,memory[address+3], memory[address+2], memory[address+1], memory[address]};
			// reset counter
			counter = 0;
		end
		else begin
			// add counter
			counter = counter + 1;
		end
	end
	always @(address)begin
		counter = 0;
	end
	
	
	
endmodule