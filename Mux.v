`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 07:03:08 PM
// Design Name: 
// Module Name: Mux
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


module Mux(
    input [31:0] a,b,
    input sel,
    output reg [31:0] Out
    );

    always @(*) 
    begin
        case (sel)
            0:Out=a;
            1:Out=b; 
            default:Out=32'bx; 
        endcase    
    end
endmodule
