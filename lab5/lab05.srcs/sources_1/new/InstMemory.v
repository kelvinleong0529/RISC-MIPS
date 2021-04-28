`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 11:59:25
// Design Name: 
// Module Name: InstMemory
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


module InstMemory(
    input [31:0] ReadAddress,
    output [31:0] Instruction
    );
    
    reg [31:0] InstMemFile [31:0];
    
    initial begin
        $readmemb("inst_mem.mem",InstMemFile);
    end
    
    assign Instruction = InstMemFile[ReadAddress];
    
endmodule
