`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2020 22:58:52
// Design Name: 
// Module Name: Registers
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


module Registers(
    input reset,
    input clock,
    input [25:21] readReg1,
    input [20:16] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    input RegWrite,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );
    reg [31:0] regFile [31:0];
    integer temp1,temp2,temp3,i;
    
    initial begin
        $readmemh("mem_reg.mem",regFile);
    end
    
    always @(readReg1 or readReg2 or writeReg)
    begin
        temp1 = readReg1;
        temp2 = readReg2;
        temp3 = writeReg;
    end
    
    always @(negedge clock)
    begin
        if (RegWrite)
            regFile[temp3] = writeData;
        if (reset)
            for (i=0;i<32;i=i+1)
                regFile[i]<=32'b0;
    end
    
    assign ReadData1 = regFile[temp1];
    assign ReadData2 = regFile[temp2];
    
endmodule
