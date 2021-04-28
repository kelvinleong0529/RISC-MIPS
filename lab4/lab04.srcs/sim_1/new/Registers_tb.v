`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2020 23:44:54
// Design Name: 
// Module Name: Registers_tb
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


module Registers_tb(   );

    reg clock;
    reg [31:0] writeData;
    reg RegWrite;
    reg [4:0] readReg1,readReg2,writeReg;
    wire [31:0] ReadData1,ReadData2;
    
    Registers test(.clock(clock),.readReg1(readReg1),.readReg2(readReg2),
    .writeReg(writeReg),.writeData(writeData),
    .RegWrite(RegWrite),.ReadData1(ReadData1),.ReadData2(ReadData2));
    
    parameter PERIOD = 100;
    
    always #(PERIOD) clock = !clock;
    
    initial begin
        clock = 1'b0;
        #200;
        RegWrite = 1'b1;
        writeReg = 5'b01110;
        writeData = 32'b11011000110001010111100001101111;
        readReg1 = 5'b0;
        readReg2 = 5'b0;
        #200;
        RegWrite = 1'b1;
        writeReg = 5'b10110;
        writeData = 32'b00011110111011000100110001101010;
        readReg1 = 5'b0;
        readReg2 = 5'b0;
        #200
        RegWrite = 1'b0;
        writeReg = 5'b0;
        writeData = 32'b00000000000000000000000000000000;
        readReg1 = 5'b01110;
        readReg2 = 5'b10110;
        
    end

endmodule
