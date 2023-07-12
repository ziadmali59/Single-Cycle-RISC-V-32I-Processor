`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 05:25:29 PM
// Design Name: 
// Module Name: Reg_File
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


module Reg_File
    (
        input clk,rst,WE,
        input [4:0] A1,A2,A3,

        input [31:0] WD3,

        output reg [31:0] RD1,RD2
    );

    reg [31:0] REG [0:31];

    always @(posedge clk, negedge rst ) 
    begin

        REG[A1]=REG[A1];
        REG[A2]=REG[A2];

        if (!rst) 
            begin
                REG[A1]=32'b0;
                REG[A2]=32'b0;    
            end
        else if(WE)
            begin
                REG[A3]=WD3;
            end    
    end

    always @(A1,A2) 
            begin
                RD1=REG[A1];
                RD2=REG[A2];    
            end
endmodule
