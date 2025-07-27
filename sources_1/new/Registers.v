`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 06:32:13 PM
// Design Name: 
// Module Name: Registers
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Registers (
    input clk,
    input [2:0] read_reg1, read_reg2, write_reg,
    input [7:0] write_data,
    input reg_write,
    output [7:0] read_data1, read_data2
);

reg [7:0] registers [7:0]; // 8 General Purpose Registers

assign read_data1 = registers[read_reg1];
assign read_data2 = registers[read_reg2];

always @(posedge clk) begin
    if (reg_write)
        $display("Writing data: %d", write_data);
        registers[write_reg] <= write_data;
        $display("Wrote ata: %d", registers[write_reg]);
        
end

endmodule

