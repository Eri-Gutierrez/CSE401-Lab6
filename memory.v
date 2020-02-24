// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module memory(
	input		wire	[1:0]		wb_ctlout,
	input		wire				branch, memread, memwrite,
	input		wire				zero,
	input		wire	[31:0]	alu_result, rdata2out,
	input		wire	[4:0]		five_bit_muxout,
	output	wire				MEM_PCSrc,
	output	wire				MEM_WB_regwrite, MEM_WB_memtoreg,
	output	wire	[31:0]	read_data, mem_alu_result,
	output	wire	[4:0]		mem_write_reg
    );

	// signals
	wire	[31:0]	read_data_in;

	// instantiations

  // Finish wiring this puppy up
	AND AND_4	(
		.membranch(branch),
		.zero(zero),
		.PCSrc(MEM_PCSrc));

	data_memory data_memory4	(
		.addr(alu_result),
		.write_data(rdata2out),
		.memwrite(memwrite),
		.memread(memread),
		.read_data(read_data_in));

	mem_wb mem_wb4	(
		.control_wb_in(wb_ctlout),
		.read_data_in(read_data_in),
		.alu_result_in(alu_result),
		.write_reg_in(five_bit_muxout),
		.regwrite(MEM_WB_regwrite),
		.memtoreg(MEM_WB_memtoreg),
		.read_data(read_data),
		.mem_alu_result(mem_alu_result),
        .mem_write_reg(mem_write_reg));

endmodule  // memory
