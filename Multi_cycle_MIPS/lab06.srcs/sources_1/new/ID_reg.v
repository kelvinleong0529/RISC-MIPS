`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2020 19:26:58
// Design Name: 
// Module Name: part_reg2
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


module part_reg2( input clock, input reset, input [4:0] instlow, input [4:0] insthigh, input regdst, input alusrc, input memtoreg,
input regwrite, input memread, input memwrite, input branch, input [1:0] aluop, input [31:0] signext, input [31:0] readdata2, input [31:0] readdata1, input [31:0] pc,
output [146:0] result);

    reg [146:0] temp;
    
    always @(negedge clock)
    begin
        temp = {pc,readdata1,readdata2,signext,aluop,branch,memwrite,memread,regwrite,memtoreg,alusrc,regdst,insthigh,instlow};
        if (reset)
            temp = 147'bx;
    end
    
    assign result = temp;
    
endmodule
