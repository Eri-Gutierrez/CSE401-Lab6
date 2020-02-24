// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps
/* execute.v */

module execute(
	input		wire	[1:0]		wb_ctl,
	input		wire	[2:0]		m_ctl,
	input		wire				regdst, alusrc,
	input		wire	[1:0]		aluop,
	input		wire	[31:0]	npcout, rdata1, rdata2, s_extendout,
	input		wire	[4:0]		instrout_2016, instrout_1511,
	output	wire	[1:0]		wb_ctlout,
	output	wire				branch, memread, memwrite,
	output	wire	[31:0]	EX_MEM_NPC,
	output	wire				zero,
	output	wire	[31:0]	alu_result, rdata2out, add_result,
	output	wire	[4:0]		five_bit_muxout
	);

	// signals
	wire	[31:0]	adder_out, b, aluout;
	wire	[4:0]		muxout;
	wire	[2:0]		control;
	wire				aluzero;

	// instantiations
   // have at it, wire this puppy up using Fig 3.1
   adder adder1(
		// output
		.add_out(adder_out),
		// inputs
		.add_in2(s_extendout),
		.add_in1(npcout));

	mux mux2(
		// output
		.npc(b),
		// inputs
		.s0(s_extendout),
		.s1(rdata2),
		.select(alusrc));

	alu alu1(
		// inputs
		.a(rdata1),
		.b(b),
		.control(control),
		// outputs
		.result(aluout),
		.zero(aluzero));

	alu_control alu_control1(
		// inputs
		.funct(s_extendout[5:0]),
		.aluop(aluop),
		// output
    	.select(control));

	bottom_mux bottom_mux1(
		 // output
		.y(muxout),
		 // inputs
		.a(instrout_1511),
		.b(instrout_2016),
		.sel(regdst));

	ex_mem ex_mem1(
		//inputs
		.ctlwb_out(wb_ctl),
		.ctlm_out(m_ctl),
		.adder_out(adder_out),
		.aluzero(aluzero),
		.aluout(aluout),
		.readdat2(rdata2),
		.muxout(muxout),
		// outputs
		.wb_ctlout(wb_ctlout),
		.branch(branch),
		.memread(memread),
		.memwrite(memwrite),
		.add_result(add_result),
		.zero(zero),
		.alu_result(alu_result),
		.rdata2out(rdata2out),
        .five_bit_muxout(five_bit_muxout));

endmodule // execute
