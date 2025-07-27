`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 06:38:19 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [3:0] opcode,
    output reg [2:0] alu_op,
    output reg reg_write, data_read, data_write, load_enable
    );
    
    always @(*) begin
        // Instruction Set Here
        case (opcode)
           4'b0000: begin alu_op = 3'b000; reg_write = 1; load_enable = 0;end // AND A, B
           4'b0001: begin alu_op = 3'b001; reg_write = 1; load_enable = 0;end // OR A, B
           4'b0010: begin alu_op = 3'b010; reg_write = 1; load_enable = 0;end // XOR A, B
           4'b0011: begin alu_op = 3'b011; reg_write = 1; load_enable = 0;end // ADD A, B
           4'b0100: begin alu_op = 3'b100; reg_write = 1; load_enable = 0;end // MOV A, B
           4'b1000: begin load_enable = 1; data_read = 1;   end // LOAD A, [B], B's memory address bata A ma
           4'b1001: begin load_enable = 1; data_write = 1; end // STORE A, [B], A bata B ko memory address ma
           default: begin load_enable = 0; end
        endcase
    end
endmodule
