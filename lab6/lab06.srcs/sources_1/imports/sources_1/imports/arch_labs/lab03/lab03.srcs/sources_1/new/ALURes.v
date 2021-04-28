`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 21:47:31
// Design Name: 
// Module Name: ALURes
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

module ALURes( input [31:0] input1, input [31:0] input2, input clock,
input reset, input [3:0] ALUCtr, output Zero, output [31:0] ALURes);

    reg [31:0] alures;
    reg zero;
    
    always @(posedge clock)
    begin
        case (ALUCtr)
        4'b0010: alures = input1 + input2;
        4'b0110: alures = input1 - input2;
        4'b0000: alures = input1 & input2;
        4'b0001: alures = input1 | input2;
        4'b0111:
        begin 
            if (input1 < input2)
                alures = 32'b00000000000000000000000000000001;
            else
                alures = 32'b0;
        end
        endcase
    end
    always @ (*) 
    begin
        zero = ( !alures )? 1:0;
        if (reset)
        begin
            zero = 1'bx;
            alures = 32'bx;
        end
    end
    assign ALURes = alures;
    assign Zero = zero;
    
endmodule
