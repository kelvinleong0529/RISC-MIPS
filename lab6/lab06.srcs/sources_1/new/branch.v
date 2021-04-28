`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2020 22:44:38
// Design Name: 
// Module Name: branch
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


module branch(
    input branch,
    input zero,
    output result
    );
    
    reg temp;
    
    initial 
    begin
        temp <= 0;
    end
    
    always @(*)
    begin
        case (branch & zero)
        1'b1: temp = 1;
        1'bx: temp = 0;
        default: temp = 0;
    endcase
    end
    
    assign result = temp;
    
endmodule
