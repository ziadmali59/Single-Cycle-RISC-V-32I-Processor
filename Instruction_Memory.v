`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 04:22:45 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [31:0] Addr_sig,
    output reg [31:0] Inst_sig
    );

    reg [31:0] mem [0:63];

    initial 
    begin
        $readmemh("TEST.data",mem);
        //read from Prog.txt    
    end

    always @(*) 
    begin
        Inst_sig=mem[Addr_sig[31:2]];    
    end



endmodule
