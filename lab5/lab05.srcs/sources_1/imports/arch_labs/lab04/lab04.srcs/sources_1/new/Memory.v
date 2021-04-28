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
    input reset,
    input clock,
    input [31:0] Address,
    input [31:0] WriteData,
    input memWrite,
    input memRead,
    output [31:0] readData,result1,result2
    );
    
    
    reg [31:0] memFile [0:63];
    integer temp,i;
    reg [31:0] temp2;
    
    initial begin
        $readmemh("mem_data.mem",memFile);
    end
    
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
        if (memWrite)
            memFile[temp] = WriteData;
        if (reset)
            for (i=0;i<64;i=i+1)
                memFile[i]<=0;
    end
    
    assign readData = temp2;
    assign result1 = memFile[4];
    assign result2 = memFile[8];

 
endmodule
