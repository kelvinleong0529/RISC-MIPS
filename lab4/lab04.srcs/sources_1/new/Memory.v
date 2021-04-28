`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 00:33:39
// Design Name: 
// Module Name: Memory
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


module Memory(
    input clock,
    input [31:0] Address,
    input [31:0] WriteData,
    input memWrite,
    input memRead,
    output [31:0] readData
    );
    
    reg [31:0] memFile [0:63];
    integer temp;
    reg [31:0] temp2;
    
    
    always @(Address)
    begin
        temp = Address;  
        if (memRead)
            temp2 = memFile[temp];
        else
            temp2 = 32'bx;  
    end
    
    always @(negedge clock)
    begin
        if (memWrite==1)
            memFile[temp] = WriteData;
    end
    
    assign readData = temp2;
 
endmodule
