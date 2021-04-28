`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2020 20:54:10
// Design Name: 
// Module Name: EX_reg
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


module part_reg3(
    input clock,
    input reset,
    input zero,
    input memtoreg,
    input branch,
    input regwrite,
    input memwrite,
    input memread,
    input [4:0] mux3,
    input [31:0] aluout,
    input [31:0] alujumpadd1,
    input [31:0] alujumpadd2,
    input [31:0] readdata2,
    output [106:0] result
    );
    
    reg [106:0] temp;
    reg [31:0] temp2;
    
    always @(negedge clock) 
    begin
        temp2 = alujumpadd1<<2 + alujumpadd2;
        temp = {readdata2,temp2,aluout,mux3,memread,memwrite,regwrite,branch,memtoreg,zero};
        if (reset)
            temp = 107'bx;
    end
    
    assign result = temp;
    
    
endmodule
