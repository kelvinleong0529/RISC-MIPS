`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2020 21:07:22
// Design Name: 
// Module Name: MEM_reg
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


module part_reg4(
    input clock,
    input memtoreg,
    input regwrite,
    input [31:0] aluout,
    input [31:0] readdata,
    input [4:0] mux3,
    output [70:0] result
    );
    
    reg [70:0] temp;
    
    always @(negedge clock) temp ={readdata,aluout,mux3,regwrite,memtoreg};
    
    assign result = temp;
    
endmodule
