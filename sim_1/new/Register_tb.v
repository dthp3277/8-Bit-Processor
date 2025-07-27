`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 08:59:58 PM
// Design Name: 
// Module Name: Register_tb
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


module Register_tb;

reg clk, reg_write;
reg [2:0] read_reg1, read_reg2, write_reg;
reg [7:0] write_data;
wire [7:0] read_data1, read_data2;

Registers uut (
.clk(clk),
.read_reg1(read_reg1), .read_reg2(read_reg2),
.write_reg(write_reg),
.write_data(write_data),
.read_data1(read_data1), .read_data2(read_data2)
);

initial begin 
    clk = 0;
    forever #5 clk = ~clk;
end

 initial begin
        // Initialize inputs
        read_reg1 = 3'd0;
        read_reg2 = 3'd1;
        write_reg = 3'd0;
        write_data = 8'd0;
        reg_write = 0;

        #10;

        // Write 42 to register 0
        write_reg = 3'd0;
        write_data = 8'd42;
        reg_write = 1;

        #10; // wait for positive edge

        reg_write = 0; // turn off write

        // Read from register 0
        read_reg1 = 3'd0;
        read_reg2 = 3'd1;

        #10;

        // Write 77 to register 1
        write_reg = 3'd1;
        write_data = 8'd77;
        reg_write = 1;

        #10;

        reg_write = 0;

        // Read from both registers
        read_reg1 = 3'd0;
        read_reg2 = 3'd1;

        #10;

        // Write 99 to register 3
        write_reg = 3'd3;
        write_data = 8'd99;
        reg_write = 1;

        #10;

        reg_write = 0;
        read_reg1 = 3'd3;
        read_reg2 = 3'd0;

        #10;

        $display("Reg[0] = %d", read_data1); // Should be 99 or 42 depending on read_reg1
        $display("Reg[1] = %d", read_data2); // Should be 77 if reg2 is 1

        $finish;
    end

endmodule
