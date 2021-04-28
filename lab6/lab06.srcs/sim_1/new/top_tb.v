`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2020 21:12:07
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


module top_tb(
    );
    
    reg clock;
    reg reset;
    
    wire [63:0] part1out;
    wire [146:0] part2out;
    wire [106:0] part3out;
    wire [70:0] part4out;
    wire [31:0] pcout,inst,readdata1,readdata2,readdata,aluout,signext,mux1out,mux2out,mux4out;
    wire [4:0] mux3out;
    wire [3:0] aluctrout;
    wire regdst,branch,memread,memtoreg,memwrite,alusrc,regwrite,zero;
    wire reset2; //for branch = 1 
    wire [1:0] aluop;
    
    PC mainpc (.in(mux4out),.clock(clock),.reset(reset),.result(pcout));
    
    InstMemory maininstmem(.ReadAddress(pcout),.Instruction(inst));
    
    part_reg1 mainpart_reg1(.clock(clock),.reset(reset2),.pcin(pcout),.instin(inst),.result(part1out));
    
    ctr mainctr(.clock(clock),.OpCode(part1out[31:26]),.reset(reset2),.RegDst(regdst),.ALUSrc(alusrc),
    .RegWrite(regwrite),.MemToReg(memtoreg),.MemRead(memread),.MemWrite(memwrite),.Branch(branch),.ALUOp(aluop));
    
    Registers mainregisters(.reset(reset),.clock(clock),.readReg1(part1out[25:21]),.readReg2(part1out[20:16]),.writeReg(part4out[6:2]),
    .writeData(mux2out),.RegWrite(part4out[1]),.ReadData1(readdata1),.ReadData2(readdata2));
    
    signext mainsignext(.clock(clock),.reset(reset),.inst(part1out[15:0]),.data(signext));
    
    part_reg2 mainpart_reg2(.clock(clock),.reset(reset2),.instlow(part1out[15:11]),.insthigh(part1out[20:16]),.regdst(regdst),.alusrc(alusrc)
    ,.memtoreg(memtoreg),.regwrite(regwrite),.memread(memread),.memwrite(memwrite),.branch(branch),.aluop(aluop),.signext(signext),
    .readdata2(readdata2),.readdata1(readdata1),.pc(part1out[63:32]+4),.result(part2out));
    
    mux1 mainmux1(.ALUSrc(part2out[11]),.ReadData2(part2out[82:51]),.signextout(part2out[50:19]),.result(mux1out));
    
    mux3 mainmux3(.RegDst(part2out[10]),.input1(part2out[4:0]),.input2(part2out[9:5]),.result(mux3out));
    
    ALUCtr mainaluctr(.clock(clock),.ALUOp(part2out[18:17]),.Funct(part2out[24:19]),.reset(reset),.ALUCtrOut(aluctrout));
    
    ALURes mainalures(.input1(part2out[114:83]),.input2(mux1out),.clock(clock),.reset(reset),.ALUCtr(aluctrout),.Zero(zero),.ALURes(aluout));
    
    part_reg3 mainpart_reg3(.clock(clock),.zero(zero),.reset(reset),.memtoreg(part2out[12]),.branch(part2out[16]),.regwrite(part2out[13]),
    .memwrite(part2out[15]),.memread(part2out[14]),.mux3(mux3out),.aluout(aluout),.alujumpadd1(part2out[50:19]),.alujumpadd2(part2out[146:115]),
    .readdata2(part2out[82:51]),.result(part3out));
    
    branch mainbranch(.branch(part3out[2]),.zero(part3out[0]),.result(reset2));
    
    Memory mainmemory(.reset(reset),.clock(clock),.Address(part3out[42:11]),.WriteData(part3out[106:75]),.memWrite(part3out[4]),.memRead(part3out[5]),
    .readData(readdata));
    
    part_reg4 mainpart_reg4(.clock(clock),.memtoreg(part3out[1]),.regwrite(part3out[3]),.aluout(part3out[42:11]),.readdata(readdata),.mux3(part3out[10:6]),
    .result(part4out));
    
    mux2 mainmux2(.MemtoReg(part4out[0]),.MemoryResult(part4out[70:39]),.ALUResult(part4out[38:7]),.result(mux2out));
    
    mux4 mainmux4(.pc(pcout),.jumpadd(part3out[74:43]),.PCSrc(reset2),.result(mux4out));
    
    parameter PERIOD = 25;
    
    always #(PERIOD) clock = !clock;
    
    initial begin
        clock = 1;
        reset = 0;
    end
    
endmodule
