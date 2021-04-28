`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 22:25:21
// Design Name: 
// Module Name: mux2
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


module mux2(
    input MemtoReg,
    input [31:0] MemoryResult,
    input [31:0] ALUResult,
    output [31:0] result
    );
    
    assign result = MemtoReg? MemoryResult:ALUResult;
endmodule
