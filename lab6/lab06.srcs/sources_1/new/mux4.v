`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2020 23:04:00
// Design Name: 
// Module Name: mux4
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


module mux4(
    input [31:0] pc,
    input [31:0] jumpadd,
    input PCSrc,
    output [31:0] result
    );
    
 
    
    assign result = PCSrc? jumpadd:(pc+1);
    
endmodule
