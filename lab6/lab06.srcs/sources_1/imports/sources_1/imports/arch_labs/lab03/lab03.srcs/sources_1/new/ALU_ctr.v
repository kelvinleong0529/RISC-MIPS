`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 20:44:38
// Design Name: 
// Module Name: ALU_ctr
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


module ALUCtr(input clock, input [1:0] ALUOp, input [5:0] Funct, 
input reset,output [3:0] ALUCtrOut);

    reg [3:0] aluctrout;
    
    always @(posedge clock)
    begin
        casex({ALUOp,Funct})
            8'b00xxxxxx: aluctrout = 4'b0010; 
            8'b01xxxxxx: aluctrout = 4'b0110;
            8'b1xxx0000: aluctrout = 4'b0010;
            8'b1xxx0010: aluctrout = 4'b0110;
            8'b1xxx0100: aluctrout = 4'b0000;
            8'b1xxx0101: aluctrout = 4'b0001;
            8'b1xxx1010: aluctrout = 4'b0111;
            default:     aluctrout = 4'b1111;
        endcase
    end
    
    always @(*)
    begin
        if (reset)
            aluctrout = 4'bx;
    end
   
    assign ALUCtrOut = aluctrout;
    
    
    
endmodule
