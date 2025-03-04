// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module mux(
    input wire [31:0] s0, s1,
    input wire select,
    output wire [31:0] npc
    );

assign npc = select ? s0 : s1;

endmodule // mux
