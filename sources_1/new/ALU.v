`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 06:27:33 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] A,
    input [7:0] B,
    input [2:0] ALU_SEL,
    output reg C_OUT,
    output reg [7:0] ALU_OUT
    );
    reg[8:0] temp_out;
    
    
    always @(*) begin
        case(ALU_SEL)
        3'b000: temp_out = A & B;
        
        3'b001: temp_out = A + B;
        
        3'b010: temp_out = A | B;
        
        3'b011: temp_out = A ^ B;
        
        3'b100: temp_out = B & B;
        default: temp_out = A + B;
        endcase
        C_OUT = temp_out[8];
        ALU_OUT = temp_out[7:0];
    end
endmodule

