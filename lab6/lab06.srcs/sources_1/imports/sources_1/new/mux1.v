`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 22:21:40
// Design Name: 
// Module Name: mux1
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


module mux1(
    input ALUSrc,
    input [31:0] ReadData2,
    input [31:0] signextout,
    output [31:0] result
    );
    
    assign result = ALUSrc? ReadData2:signextout;
endmodule
