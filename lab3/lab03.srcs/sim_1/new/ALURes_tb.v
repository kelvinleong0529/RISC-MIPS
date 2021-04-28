`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 22:06:32
// Design Name: 
// Module Name: ALURes_tb
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


module ALURes_tb(   );

    reg  [31:0] input1; 
    reg  [31:0] input2; 
    reg  [3:0] ALUCtr;
    wire Zero;
    wire [31:0] ALURes;
    
    ALURes test (.input1(input1),.input2(input2),.ALUCtr(ALUCtr),.Zero(Zero),.ALURes(ALURes));
    
    initial begin
        
        #100;
        input1 = 32'b00000010111001011101110101011101;
        input2 = 32'b00000000110000011101111100010001;
        ALUCtr = 4'b0010;
        #100;
        input1 = 32'b00000000110000011101111100010001;
        input2 = 32'b00000000110000011101111100010001;
        ALUCtr = 4'b0110;
        #100;
        input1 = 32'b00000010111001011101110101011101;
        input2 = 32'b00000000110000011101111100010001;
        ALUCtr = 4'b0000;
        #100;
        input1 = 32'b00000010111001011101110101011101;
        input2 = 32'b00000000110000011101111100010001;
        ALUCtr = 4'b0001;
        #100;
        input1 = 32'b00000010111001011101110101011101;
        input2 = 32'b00000000110000011101111100010001;
        ALUCtr = 4'b0111;
        
    end
    
endmodule
