`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2023 02:38:03 AM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit
(
    input [6:0] op,
    input [14:12] funct3,
    input [30:30] funct7, 
    input Sign,Zero,
    output reg PCsrc,Resultsrc,MemWrite,AluSrc,RegWrite,
    output reg [1:0] ImmSrc,
    output reg [2:0] AluControl
);
reg [1:0] ALUOp;
reg Branch;

always @(*) 
begin
    case (op)
        7'b000_0011:{RegWrite,ImmSrc,AluSrc,MemWrite,Resultsrc,Branch,ALUOp}=9'b100_101_000;
        7'b010_0011:{RegWrite,ImmSrc,AluSrc,MemWrite,Resultsrc,Branch,ALUOp}=9'b001_11x_000;
        7'b011_0011:{RegWrite,ImmSrc,AluSrc,MemWrite,Resultsrc,Branch,ALUOp}=9'b1xx_000_010;
        7'b001_0011:{RegWrite,ImmSrc,AluSrc,MemWrite,Resultsrc,Branch,ALUOp}=9'b100_100_010;
        7'b110_0011:{RegWrite,ImmSrc,AluSrc,MemWrite,Resultsrc,Branch,ALUOp}=9'b010_00x_101;
        default:{Branch,Resultsrc,MemWrite,AluSrc,ImmSrc,RegWrite,ALUOp}=9'bx;
    endcase

    case (funct3)
        3'b000:PCsrc=Zero&Branch;
        3'b001:PCsrc=(~Zero)&Branch;
        3'b100:PCsrc=Sign&Branch; 
        default: PCsrc='bx;
    endcase

    case (ALUOp)
        2'b00:AluControl=3'b000;
        2'b01:
            begin
                case (funct3)
                    3'b000:AluControl=3'b010;
                    3'b001:AluControl=3'b010;
                    3'b100:AluControl=3'b010;
                    default:AluControl=3'bxxx; 
                endcase
            end
        2'b10:
            begin
                case (funct3)
                    3'b000:
                        begin
                            if ({funct7,op[5]}==2'b00||{funct7,op[5]}==2'b01||{funct7,op[5]}==2'b10) 
                            begin
                                AluControl=3'b000;
                            end
                            else if ({funct7,op[5]}==2'b11) 
                            begin
                                AluControl=3'b010;    
                            end
                        end
                    3'b001:AluControl=3'b001;
                    3'b100:AluControl=3'b100;
                    3'b101:AluControl=3'b101;
                    3'b110:AluControl=3'b110;
                    3'b111:AluControl=3'b111;
                    default: AluControl=3'bxxx;
                endcase
            end

        default: AluControl=3'b000;
    endcase    
end
endmodule
