`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 01:12:00
// Design Name: 
// Module Name: signext
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


module signext(
    input clock,
    input reset,
    input [15:0] inst,
    output [31:0] data
    );
    
    integer temp;
    reg [31:0] result;
    
    always @(posedge clock)
    begin
        if (reset)
            result = 32'bx;
        else if (inst>=16'b1000000000000000)
            result = {16'b1111111111111111,inst};
        else
            result = {16'b0000000000000000,inst};

    end
    
    
    assign data = result;
    
endmodule
