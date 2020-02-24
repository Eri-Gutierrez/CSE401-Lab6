// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module pc_mod(
    output reg [31:0] PC,
    input wire [31:0] npc
    );

    initial begin
        PC <= 0;
    end
    always @ ( npc ) begin
        #1 PC <= npc;
    end

endmodule   // pc_mod
