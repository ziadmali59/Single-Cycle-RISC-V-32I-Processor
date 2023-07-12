`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2023 06:23:16 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] ImmExt,
    output  [31:0] Out,
    input clk,arst,load,
    input PCsrc


    );
    reg [31:0] Q_reg,Q_next;
    always @(posedge clk,negedge arst ) 
    begin
        if (!arst) 
            begin
                Q_reg=32'b0;    
            end

        else if(load)
            begin
                Q_reg<=Q_next;    
            end  
            else
                Q_reg<=Q_reg;  
    end
always @(*) 
            begin
                case (PCsrc)
                    1'b0:Q_next=Q_reg+4;
                    1'b1:Q_next=Q_reg+ImmExt; 
                    default: Q_next=32'b0;
                endcase
            end

    assign Out=Q_reg;
endmodule
