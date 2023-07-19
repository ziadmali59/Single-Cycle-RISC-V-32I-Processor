`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2023 01:30:14 AM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory
    (
        input clk,WE,
        input [31:0] A,WD,
        output reg [31:0] RD
    );
    reg [31:0] Data_memo [0:63];
    always @(posedge clk ) 
    begin
        if(WE)
        begin
        Data_memo[A[31:2]]<=WD;
        end
    end

    always @(*) 
    begin
        RD=Data_memo[A];    
    end
endmodule
