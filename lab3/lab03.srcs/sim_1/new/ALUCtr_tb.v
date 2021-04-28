`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 20:52:59
// Design Name: 
// Module Name: ALUCtr_tb
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


module ALUCtr_tb(   );

    reg [1:0] ALUOp;
    reg [5:0] Funct;
    wire [3:0] ALUCtrOut;
    
    ALUCtr test (.ALUOp(ALUOp),.Funct(Funct),.ALUCtrOut(ALUCtrOut));
    
    initial begin
        #100;
        #100;
        ALUOp = 2'b00;
        Funct = 6'bxxxxxx;
        #100;
        ALUOp = 2'bx1;
        Funct = 6'bxxxxxx;
        #100;
        ALUOp = 2'b1x;
        Funct = 6'bxx0000;
        #100;
        ALUOp = 2'b1x;
        Funct = 6'bxx0010;
        #100;
        ALUOp = 2'b1x;
        Funct = 6'bxx0100;
        #100;
        ALUOp = 2'b1x;
        Funct = 6'bxx0101;
        #100;
        ALUOp = 2'b1x;
        Funct = 6'bxx1010;
          
     end

endmodule
