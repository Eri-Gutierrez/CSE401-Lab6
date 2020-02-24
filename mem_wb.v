// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps
/* mem_wb.v */

module mem_wb(
	input		wire	[1:0]		control_wb_in,
	input		wire	[31:0]	read_data_in, alu_result_in,
	input		wire	[4:0]		write_reg_in,
	output	reg				regwrite, memtoreg,
	output	reg	[31:0]	read_data, mem_alu_result,
	output	reg	[4:0]		mem_write_reg
    );

initial begin
	regwrite <= 0;
	memtoreg <= 0;
	read_data <= 0;
	mem_alu_result <= 0;
	mem_write_reg <= 0;
	//finish this thread
end

always@* begin
	#1
	//finish this thread
	regwrite <= control_wb_in[1];
    memtoreg <= control_wb_in[0];
    read_data <= read_data_in;
    mem_alu_result <= alu_result_in;
    mem_write_reg <= write_reg_in;
end

endmodule // mem_wb
