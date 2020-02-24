// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module writeback(
    input	wire MEM_WB_memtoreg,
	input	wire [31:0]	read_data, mem_alu_result,
    output wire [31:0] WB_mux_writedata
    );

    // instantiation
	mux mux3(
				.npc(WB_mux_writedata),
				.select(MEM_WB_memtoreg),
				.s0(read_data),
				.s1(mem_alu_result)
    );
endmodule	// writeback
