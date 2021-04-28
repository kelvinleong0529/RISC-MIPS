`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2020 16:57:32
// Design Name: 
// Module Name: PC_tb
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


module PC_tb(

    );
    
    reg [31:0] in;
    reg clock;
    reg reset;
    wire [31:0] result;
    
    PC test(.in(in),.clock(clock),.reset(reset),.result(result));
    
    parameter PERIOD = 100;
    always #(PERIOD*2) clock=!clock;
    
    initial begin
    clock = 1;
    reset=0;
    #400;
    reset=1;
    end
endmodule
