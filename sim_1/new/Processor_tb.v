`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 06:53:20 PM
// Design Name: 
// Module Name: Processor_tb
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


module Processor_tb();
reg clk, reset;

Processor uut (
.clk(clk),
.reset(reset)
);

always #5 clk = ~clk;


initial begin
    $display("Initializing Processor..");
    clk = 0;
    #1;
    force uut.RF.registers[0] = 8'h69;
    force uut.RF.registers[1] = 8'h03;
    #1;
    release uut.RF.registers[1];
    #10
    reset = 1;
    #10 
    reset = 0;
    
    #60
    
    $finish;
end

endmodule
