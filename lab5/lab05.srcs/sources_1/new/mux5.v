`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 22:34:24
// Design Name: 
// Module Name: mux5
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


module mux5(
    input [31:0] PC,
    input Branch,
    input Zero,
    input [31:0] signextout,
    output [31:0] result
    );
    
    reg [31:0] aluout;
    reg [31:0] temp;
    
    always @(*)
    begin
        temp = PC+1;
        aluout = temp[31:28]+signextout[25:0]<<2;
    end
    
    
    assign result = (Branch & Zero)? aluout:temp;
    
endmodule
