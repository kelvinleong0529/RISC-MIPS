`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2020 13:06:31
// Design Name: 
// Module Name: top_tb
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


module top(
    );
    
    reg clock;
    reg reset;
    
    wire [31:0] PCwire;
    wire [31:0] inst;
    wire [31:0] aluout;
    wire [31:0] ReadData1, ReadData2;
    wire [31:0] memoryout;
    wire [31:0] mux1out,mux2out,mux4out,mux5out;
    wire [4:0] mux3out;
    wire [31:0] signextout;
    wire [3:0] aluctrout;
    wire Zero;
        
    wire RegDst;
    wire Jump;    
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    
    parameter PERIOD = 50;
    
    ALUCtr mainaluctr(.ALUOp(ALUOp),.Funct(inst[5:0]),.ALUCtrOut(aluctrout),.reset(reset));
   
    Registers mainregister (.reset(reset),.clock(clock),.readReg1(inst[25:21]),.readReg2(inst[20:16]),
    .writeReg(mux3out),.writeData(mux2out),.RegWrite(RegWrite),.ReadData1(ReadData1),.ReadData2(ReadData2));
    
    ALURes mainalures (.input1(ReadData1),.input2(mux1out),.ALUCtr(aluctrout),.Zero(Zero),.ALURes(aluout),.reset(reset));

    ctr mainctr (.OpCode(inst[31:26]),.RegDst(RegDst),.ALUSrc(ALUSrc),.RegWrite(RegWrite),.MemToReg(MemtoReg),
    .MemRead(MemRead),.MemWrite(MemWrite),.Branch(Branch),.ALUOp(ALUOp),.Jump(Jump),.reset(reset));

    signext mainsignext(.inst(inst[15:0]),.data(signextout),.reset(reset));
    
    Memory mainmemory(.clock(clock),.Address(aluout),.WriteData(ReadData2),.memWrite(MemWrite),
    .memRead(MemRead),.readData(memoryout),.reset(reset));
    
    mux1 mainmux1(.ALUSrc(ALUSrc),.ReadData2(ReadData2),.signextout(signextout),.result(mux1out));
    
    mux2 mainmux2(.MemtoReg(MemtoReg),.MemoryResult(memoryout),.ALUResult(aluout),.result(mux2out));

    mux3 mainmux3(.RegDst(RegDst),.input1(inst[20:16]),.input2(inst[15:11]),.result(mux3out));

    mux5 mainmux5(.PC(PCwire),.Branch(Branch),.Zero(Zero),.signextout(signextout),.result(mux5out));

    mux4 mainmux4(.Jump(Jump),.inst(inst[25:0]),.PC(PCwire),.mux5out(mux5out),.result(mux4out));

    PC mainPC(.in(mux4out),.result(PCwire),.clock(clock),.reset(reset));
    
    InstMemory maininstmemory(.ReadAddress(PCwire),.Instruction(inst));
    
    always #(PERIOD) clock = !clock;
    
    initial begin
        clock = 1;
        reset = 0;
    end
    
endmodule
