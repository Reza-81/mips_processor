`timescale 1ns / 1ps
module mips(
	input clk
	);
	
	// Instantiate the fetch
	fetch fetch (
		 .clk(clk), 
		 .pc_source((ex_mem_register.BranchOut && ex_mem_register.zeroFlagOut) !== 1'bX ? (ex_mem_register.BranchOut && ex_mem_register.zeroFlagOut) : 0), //ex_mem_register.BranchOut && ex_mem_register.zeroFlagOut
		 .branch_target(ex_mem_register.branchTargetOut-8),
		 .hit(), //output
		 .next_pc(), 
		 .instruction()
		 );
		 	
	// Instantiate the if_id_register
	if_id_register if_id_register (
		 .clk(clk), 
		 .hit(),
		 .next_pc(fetch.next_pc), 
		 .instruction(fetch.instruction), 
		 .instruction_out(), //output
		 .next_pc_out()
		 );
	
	// Instantiate the decode
	decode decode (
		 .clk(clk), 
		 .instruction(if_id_register.instruction_out),
		 .reg_write(mem_wb_register.RegWriteOut), //?
		 .write_reg(mem_wb_register.writeRegOut),
		 .write_data(write_back.writeData),
		 .rt(), //output
		 .rd(), 
		 .opcode(), 
		 .read_data_1(), 
		 .read_data_2(), 
		 .sig_nextended_immediate()
		 );
	
	// Instantiate the control_unite
	control_unite control_unite (
		 .opcode(decode.opcode), 
		 .reg_dst(), //output
		 .alu_src(), 
		 .mem_to_reg(), 
		 .reg_write(), 
		 .mem_read(), 
		 .mem_write(), 
		 .branch(), 
		 .alu_op()
		 );
	
	// Instantiate the id_ex_register
	id_ex_register id_ex_register (
		.clk(clk), 
		.hit(fetch.hit), 
		.readData1(decode.read_data_1), 
		.readData2(decode.read_data_2), 
		.signExImmediate(decode.sig_nextended_immediate), 
		.RegDst(control_unite.reg_dst), 
		.ALUSrc(control_unite.alu_src), 
		.MemtoReg(control_unite.mem_to_reg), 
		.RegWrite(control_unite.reg_write), 
		.MemRead(control_unite.mem_read), 
		.MemWrite(control_unite.mem_write), 
		.Branch(control_unite.branch), 
		.ALUOp(control_unite.alu_op), 
		.rt(decode.rt), 
		.rd(decode.rd), 
		.funct(decode.sig_nextended_immediate[5:0]), 
		.nextPC(if_id_register.next_pc_out), 
		.readData1Out(), //output
		.readData2Out(), 
		.signExImmediateOut(), 
		.RegDstOut(), 
		.ALUSrcOut(), 
		.MemtoRegOut(), 
		.RegWriteOut(), 
		.MemReadOut(), 
		.MemWriteOut(), 
		.BranchOut(), 
		.ALUOpOut(), 
		.rtOut(), 
		.rdOut(), 
		.functOut(), 
		.nextPCOut()
		);
		
	
	// Instantiate the execute
	execute execute (
		.clk(clk), 
		.ALUReadData1(id_ex_register.readData1Out), 
		.ALUReadData2(id_ex_register.readData2Out), 
		.immediate(id_ex_register.signExImmediateOut), //?
		.pc(id_ex_register.nextPCOut), //?
		.funct(id_ex_register.functOut), 
		.ALUOp(id_ex_register.ALUOpOut), 
		.rt(id_ex_register.rtOut), 
		.rd(id_ex_register.rdOut), 
		.ALUSrc(id_ex_register.ALUSrcOut), 
		.rgdst(id_ex_register.RegDstOut), 
		.aluresult(), //output
		.zero(), 
		.addresult(), 
		.alureaddata2(), 
		.rd_or_rt()
		);
		
	// Instantiate the ex_mem_register
	ex_mem_register ex_mem_register (
		.clk(clk), 
		.hit(fetch.hit), 
		.branchTarget(execute.addresult), //?
		.zeroFlag(execute.zero), 
		.ALUResult(execute.aluresult), 
		.readData2(id_ex_register.readData2Out), 
		.writeReg(id_ex_register.RegDstOut == 1 ? id_ex_register.rdOut : id_ex_register.rtOut), //?
		.MemRead(id_ex_register.MemReadOut), 
		.MemWrite(id_ex_register.MemWriteOut), 
		.Branch(id_ex_register.BranchOut), 
		.RegWrite(id_ex_register.RegWriteOut), 
		.MemToReg(id_ex_register.MemtoRegOut), 
		.branchTargetOut(), //output
		.zeroFlagOut(), 
		.ALUResultOut(), 
		.readData2Out(), 
		.writeRegOut(), 
		.MemReadOut(), 
		.MemWriteOut(), 
		.BranchOut(), 
		.RegWriteOut(), 
		.MemToRegOut(), 
		.hitOut()
		);
	
	// Instantiate the data_memory
	data_memory data_memory (
		.clk(clk), 
		.address(ex_mem_register.ALUResultOut), 
		.writeData(ex_mem_register.readData2Out), 
		.MemRead(ex_mem_register.MemReadOut), 
		.MemWrite(ex_mem_register.MemWriteOut), 
		.readData() //output
		);
	
	// Instantiate the mem_wb_register
	mem_wb_register mem_wb_register (
		.clk(clk), 
		.hit(fetch.hit), 
		.readData(data_memory.readData), 
		.ALUResult(ex_mem_register.ALUResultOut), 
		.writeReg(ex_mem_register.writeRegOut), 
		.RegWrite(ex_mem_register.RegWriteOut), 
		.MemtoReg(ex_mem_register.MemToRegOut), 
		.hitOut(), //output
		.readDataOut(), 
		.ALUResultOut(), 
		.writeRegOut(), 
		.RegWriteOut(), 
		.MemtoRegOut()
		);
	
	// Instantiate the write_back
	write_back write_back (
		.MemtoReg(mem_wb_register.MemtoRegOut), 
		.readData(mem_wb_register.readDataOut), 
		.ALUResult(mem_wb_register.ALUResultOut), 
		.writeData() //output
		);


endmodule
