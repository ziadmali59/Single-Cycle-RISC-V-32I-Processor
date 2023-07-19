`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 06:14:23 PM
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend
    (
        input [1:0] ImmSrc,

        input [31:7] In_ex,
        output reg [31:0] ImmExt

    );
    always @(*) 
    begin
        case (ImmSrc)
            2'b00:ImmExt={{20{In_ex[31]}},In_ex[31:20]};
            2'b01:ImmExt={{20{In_ex[31]}},In_ex[31:25],In_ex[11:7]};
            2'b10:ImmExt={{20{In_ex[31]}},In_ex[7],In_ex[30:25],In_ex[11:8],1'b0};
            2'b11: ImmExt=32'b0;
            default: ImmExt=32'b0;
        endcase    
        
    end
endmodule
