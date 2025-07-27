`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 06:35:46 PM
// Design Name: 
// Module Name: InstructionDecoder
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


module InstructionDecoder(
    input [9:0] instruction,
    output reg[3:0] opcode,
    output reg[2:0] dest, src
    );
    always @(*) begin
        opcode = instruction[9:6];
        dest = instruction[5:3];
        src = instruction[2:0];
    end
endmodule
