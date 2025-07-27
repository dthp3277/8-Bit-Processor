`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 09:24:00 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU8_tb;

reg [7:0] A, B;
reg [3:0] ALU_SEL;

wire[7:0] ALU_OUT;

wire C_OUT;

ALU uut (
    .A(A),
    .B(B),
    .ALU_SEL(ALU_SEL),
    .C_OUT(C_OUT),
    .ALU_OUT(ALU_OUT)
);

integer i;
initial begin
    A = 8'h0A;
    B = 8'h12;
    ALU_SEL = 4'b0000;


    for(i = 0; i < 15; i=i+1) begin
    #10
        ALU_SEL = ALU_SEL + 4'b0001;
    end
end
endmodule