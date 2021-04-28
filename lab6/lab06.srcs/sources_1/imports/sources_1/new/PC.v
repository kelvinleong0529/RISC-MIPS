`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 23:20:26
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] in,
    input clock,
    input reset,
    output [31:0] result
    );
    
    reg [31:0] PC;
    
    initial begin
        PC <= 0;
    end
    
    always @(posedge clock)
    begin
        PC = in;
        if (reset)
            PC = 32'b0;
    end
    
    assign result = PC;
    
endmodule
