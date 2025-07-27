`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2025 11:08:08 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [7:0] address,
    output reg[9:0] instruction
    );
    
    reg [9:0] memory [0:255];
    
    initial begin
        memory[0] = 10'b1001000001;
    end
    
    always @(*) begin
        instruction = memory[address];
    end
endmodule
