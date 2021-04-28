`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2020 01:34:27
// Design Name: 
// Module Name: signext_tb
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


module signext_tb(   );

    reg [15:0] inst;
    wire [31:0] data;
    
    signext test (.inst(inst),.data(data));
    
    initial begin
    
    inst = 16'b0;
    #200;
    inst = 16'b1111111111111111;
    #200;
    inst = 16'b0000000101000000;
    #200;
    inst = 16'b1011010000000000;
    #200;
    inst = 16'b0010111000001000;
    
    end
    
endmodule
