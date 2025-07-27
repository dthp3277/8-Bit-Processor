`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 06:42:41 PM
// Design Name: 
// Module Name: Processor
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


module Processor(
    input clk,
    input reset
);
    
wire [9:0] ins, instruction;
wire [3:0] opcode;
wire [2:0] dest, src;

wire [7:0] reg_a, reg_b, alu_result, pc, write_data, read_data, data_addr;
wire [7:0] selected_data;
wire [2:0] alu_op;
wire reg_write, carry, read, write, load_enable;

ProgramCounter PC(
.clk(clk),
.reset(reset),
.pc(pc)
);

InstructionMemory Mem(
.address(pc),
.instruction(instruction)
);

DataMemory DM(
.clk(clk),
.read(read), 
.write(write),
.address(reg_b), 
.write_data(reg_a),
.read_data(read_data)
);

assign selected_data = load_enable ? read_data : alu_result;

InstructionRegister IR(
.clk(clk),
.ins_in(instruction),
.ins_out(ins)
);

InstructionDecoder DEC(
.instruction(ins),
.opcode(opcode),
.dest(dest),
.src(src)
);

ControlUnit CU (
.opcode(opcode),
.alu_op(alu_op),
.reg_write(reg_write),
.data_read(read),
.data_write(write),
.load_enable(load_enable)
);

Registers RF (
    .clk(clk),
    .read_reg1(dest),
    .read_reg2(src),
    .write_reg(dest),
    .write_data(selected_data),
    .reg_write(reg_write),
    .read_data1(reg_a),
    .read_data2(reg_b)
);

ALU alu (
    .A(reg_a),
    .B(reg_b),
    .ALU_SEL(alu_op),
    .ALU_OUT(alu_result),
    .C_OUT(carry)
);

endmodule
