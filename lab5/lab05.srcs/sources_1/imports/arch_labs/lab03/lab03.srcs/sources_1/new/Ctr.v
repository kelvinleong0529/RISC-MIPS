`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2020 23:35:21
// Design Name: 
// Module Name: Ctr
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


module ctr(
    input [5:0] OpCode,
    input reset,
    output RegDst,
    output ALUSrc,
    output RegWrite,
    output MemToReg,
    output MemRead,
    output MemWrite,
    output Branch,
    output [1:0] ALUOp,
    output Jump);
    
    reg regdst;
    reg alusrc;
    reg memtoreg;
    reg regwrite;
    reg memwrite;
    reg memread;
    reg branch;
    reg [1:0] aluop;
    reg jump;
    
    always @(OpCode)
    begin
        case(OpCode)
        6'b000000: //R type
        begin
            regdst   = 1;
            alusrc   = 0;
            memtoreg = 0;
            regwrite = 1;
            memread  = 0;
            memwrite = 0;
            branch   = 0;
            aluop    = 2'b10;
            jump     = 0;
         end
         
        6'b100011: //lw
        begin
            regdst   = 0;
            alusrc   = 1;
            memtoreg = 1;
            regwrite = 1;
            memread  = 1;
            memwrite = 0;
            branch   = 0;
            aluop    = 2'b00;
            jump     = 0;
         end
         
         6'b101011: //sw
        begin
            regdst   = 1'bx;
            alusrc   = 1;
            memtoreg = 1'bx;
            regwrite = 0;
            memread  = 0;
            memwrite = 1;
            branch   = 0;
            aluop    = 2'b00;
            jump     = 0;
         end
         
         6'b000100: //beq
        begin
            regdst   = 1'bx;
            alusrc   = 0;
            memtoreg = 1'bx;
            regwrite = 0;
            memread  = 0;
            memwrite = 0;
            branch   = 1;
            aluop    = 2'b01;
            jump     = 0;
         end
         
         6'b000010: //Jump
        begin
            regdst   = 0;
            alusrc   = 0;
            memtoreg = 0;
            regwrite = 0;
            memread  = 0;
            memwrite = 0;
            branch   = 0;
            aluop    = 2'b00;
            jump     = 1;
         end
         
         default:
         begin
            regdst   = 0;
            alusrc   = 0;
            memtoreg = 0;
            regwrite = 0;
            memread  = 0;
            memwrite = 0;
            branch   = 0;
            aluop    = 2'b00;
            jump     = 0;
         end
        endcase
    end     
    
    always @(*)
    begin
        if (reset)
            regdst   = 1'bx;
            alusrc   = 1'bx;
            memtoreg = 1'bx;
            regwrite = 1'bx;
            memread  = 1'bx;
            memwrite = 1'bx;
            branch   = 1'bx;
            aluop    = 2'bx;
            jump     = 1'bx;
    end
    
    assign RegDst = regdst;
    assign ALUSrc = alusrc;
    assign RegWrite = regwrite;
    assign MemToReg = memtoreg;
    assign MemRead = memread;
    assign MemWrite = memwrite;
    assign Branch = branch;
    assign ALUOp = aluop;
    assign Jump = jump;

endmodule
