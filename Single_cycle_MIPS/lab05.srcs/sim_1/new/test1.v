`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2020 14:30:53
// Design Name: 
// Module Name: test1
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


module test1(

    );
    
    reg [31:0] address;
    reg reset;
    wire [31:0] result;
    wire regdst;
    wire alusrc;
    wire memtoreg;
    wire regwrite;
    wire memwrite;
    wire memread;
    wire branch;
    wire [1:0] aluop;
    wire jump;
    
    InstMemory test(.ReadAddress(address),.Instruction(result));
    ctr main (.OpCode(result[31:26]),.reset(reset),.RegDst(regdst),.ALUSrc(alusrc),
    .RegWrite(regwrite),.MemToReg(memtoreg),.MemRead(memread),.MemWrite(memwrite),.Branch(branch),
    .ALUOp(aluop),.Jump(jump));
    
    
    initial begin
        reset=0;
        address = 0;
        #200;
        address = 1;
        #200;
        address = 2;
        #200;
        address = 3;
        #200;
        address = 4;
    end
    
endmodule
