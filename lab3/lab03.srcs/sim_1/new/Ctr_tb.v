`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 13:30:47
// Design Name: 
// Module Name: Ctr_tb
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


module Ctr_tb();

    reg [5:0] opcode;
    wire regdst;
    wire alusrc;
    wire memtoreg;
    wire memread;
    wire regwrite;
    wire memwrite;
    wire branch;
    wire [1:0] aluop;
    wire jump;
    
    ctr test (
    .OpCode(opcode),
    .RegDst(regdst),
    .ALUSrc(alusrc),
    .RegWrite(regwrite),
    .MemToReg(memtoreg),
    .MemRead(memread),
    .MemWrite(memwrite),
    .Branch(branch),
    .ALUOp(aluop),
    .Jump(jump)
    );
    
    initial begin
        opcode = 0;
        
        #100;
        #100;
        opcode = 6'b000000;
        #100;
        opcode = 6'b100011;
        #100;
        opcode = 6'b101011;
        #100;
        opcode = 6'b000100;
        #100;
        opcode = 6'b000010;
     end

endmodule
