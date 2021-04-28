`timescale 1ns / 1ps
module part_reg1(input clock,input reset, input [31:0] pcin,input [31:0] instin,output [63:0] result);
   reg [63:0] temp;
   
   always @(negedge clock)
   begin
    temp = {pcin+1,instin};
    if (reset)
        temp = 64'bx;
   end
   
   assign result = temp;
   
endmodule
