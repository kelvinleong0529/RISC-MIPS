`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 00:42:32
// Design Name: 
// Module Name: Memory_tb
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


module Memory_tb(   );
    
    reg clock;
    reg [31:0] Address,WriteData;
    reg memWrite,memRead;
    wire [31:0] readData;
    
    Memory test(.clock(clock),.Address(Address),.WriteData(WriteData),.memWrite(memWrite),
    .memRead(memRead),.readData(readData));
    
    parameter PERIOD = 100;
    
    always #(PERIOD) clock = !clock;
    
    initial begin
        clock = 1'b0;
        memWrite = 1'b1;
        memRead = 1'b0;
        WriteData = 32'h8754ef73;
        Address = 32'b000000000000000000000000000101101;
        #200;
        memWrite = 1'b1;
        memRead = 1'b0;
        WriteData = 32'h687fe3a2;
        Address = 32'b000000000000000000000000000001111;
        #200
        memWrite = 1'b0;
        memRead = 1'b1;
        WriteData = 32'h436ce28a;
        Address = 32'b000000000000000000000000000110001;
        #200
        memWrite = 1'b0;
        memRead = 1'b1;
        WriteData = 32'h4352fe8a;
        Address = 32'b000000000000000000000000000101101;
        #200
        memWrite = 1'b0;
        memRead = 1'b1;
        WriteData = 32'hc4352ba8;
        Address = 32'b000000000000000000000000000001111;
    end
    
endmodule
