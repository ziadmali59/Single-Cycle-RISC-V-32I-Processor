`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2023 05:36:50 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] srcA,
    input [31:0] srcB,
    input [2:0] ALUCONTROL,
    output reg [31:0] ALUresult,
    output reg Zero_flag,
    output reg SIGN_flag
    );
        reg [32:0] tempResult;
    always @(*) 
    begin
        case (ALUCONTROL)
            3'b000:
                begin
                    tempResult={1'b0,srcA}+{1'b0,srcB};
                    ALUresult=tempResult[31:0];
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                end
            3'b001:
                begin
                    ALUresult=srcA<<srcB;
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                end
            
            3'b010:
                begin
                    tempResult={1'b0,srcA}-{1'b0,srcB};
                    ALUresult=tempResult[31:0];
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];                  
                end
            
            3'b011:
                begin
                    ALUresult=srcA^srcB;
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                end
            
            3'b100:
                begin
                    ALUresult=srcA^srcB;
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                end
            3'b101:
                begin
                    ALUresult=srcA>>|srcB;
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                end
            3'b110:
                begin
                    ALUresult=srcA|srcB;
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                    
                end
            
            3'b111:
                begin
                    ALUresult=srcA&srcB;
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                    
                end
            
            default:
                begin
                    ALUresult=32'b0;
                    Zero_flag=~(|ALUresult);
                    SIGN_flag=ALUresult[31];
                    
                end
        endcase    
    end
endmodule
