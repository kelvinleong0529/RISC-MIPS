`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 22:34:24
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
    input Jump,
    input [25:0] inst,
    input [31:0] PC,
    input [31:0] mux5out,
    output [31:0] result
    );
    
    reg [31:0] JumpAddress;
    reg [31:0] temp;
    
    always @(*)
    begin
        temp = PC+1;
        JumpAddress = {temp[31:28],inst<<2};
    end
    
    assign result = Jump? JumpAddress:mux5out;
    
endmodule
