// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps
/* data_memory.v */

module data_memory (
   input		wire	[31:0]	addr,				// Memory Address
   input		wire	[31:0]	write_data,		// Memory Address Contents
   input		wire				memwrite, memread,
	output	reg	[31:0]	read_data		// Output of Memory Address Contents
	);

	// Register Declaration
   reg [31:0] DMEM[0:255];  // 256 words of 32-bit memory

   integer i;

	initial begin

		read_data <= 0;

		//  Initialize DMEM[0-5] from data.txt
		$readmemb("data.txt",DMEM);

		// Initialize DMEM[6-255] to 6-255
		for (i = 6; i < 256; i = i + 1)
			DMEM[i] = i;

		//Display DMEM[0-5]
		$display("From Data Memory (data.txt):");
		for (i = 0; i < 6; i = i + 1)
			$display("\tDMEM[%0d] = %0h", i, DMEM[i]);

		//Display DMEM[6-9]
		$display("From Data Memory (initial):");
		for (i = 6; i < 10; i = i + 1)
			$display("\tDMEM[%0d] = %0d", i, DMEM[i]);

		//Display DMEM[255]
		$display("\t...");
		$display("\tDMEM[%0d] = %0d", 255, DMEM[255]);

   end

   always@(addr) begin
		//finish this thread. Hint: Requires 2 if statements
		if ((memread == 1) && (memwrite == 0))
            // Read data
				read_data <= DMEM[addr];
		if ((memwrite == 1) && (memwrite == 0))
				// Write data
            DMEM[addr] <= write_data;
	end

endmodule // data_memory
