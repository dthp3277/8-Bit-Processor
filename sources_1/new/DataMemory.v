`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 08:50:23 AM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input clk,
    input read, write,
    input [7:0] address, write_data,
    output reg [7:0] read_data
    );
    
    
    reg [7:0] memory [0:255];
    
    initial begin
        memory[4] = 8'h12; // memory address 0000 0100 has the value 7
    end
    
    always @(posedge clk) begin 
        if(write) 
            memory[address] <= write_data;
    end
    
    always @(*) begin
        if(read) 
            read_data <= memory[address];
        else
            read_data <= 8'bz;
   end
endmodule
