// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps
/* and.v */

module AND (
	input	wire	membranch, zero,
	output	wire	PCSrc
    );

	assign PCSrc = membranch && zero;

endmodule // AND
