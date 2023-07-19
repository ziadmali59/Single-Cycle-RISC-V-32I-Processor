`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 03:05:35 PM
// Design Name: 
// Module Name: CPU_TB
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


module CPU_TB();

reg clk,arst;
CPU DUT (.clk(clk),.arst(arst));

initial 
begin
    clk=1'b0;
    forever begin
        #10 clk=~clk;
    end
end

initial 
begin
    #2000 $stop;
end

initial 
begin
   arst=1'b0;
   #5
   arst=1'b1; 
end
endmodule
