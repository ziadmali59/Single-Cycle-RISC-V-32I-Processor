`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 04:56:45 PM
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk,arst
    );
    //PC Signals
    wire PCsrc,load;
    assign load=1'b1;
    wire [31:0] ImmExt,PC_Out;
    //Instruction Memory Signals
    wire [31:0] Inst;
    //Reg_File Signals
    wire [31:0] RD1,RD2,WD3;
    wire WE_REG;
    //Sign_Extend Signals
    wire [1:0] ImmSrc;
    //Mux to ALU Signals
    wire AluSrc;
    wire [31:0] scrB;

    //ALU Signals
    wire [2:0]ALUCONTROL;
    wire [31:0] ALURESULT;
    wire Zero_flag,SIGN_flag;

    //Data_Memory Signals
    wire WE_MEM;
    wire [31:0] Read_Data;

    //Write_back Signals
    wire R_src;


    //Control unit Signals
    

    PC P1
    (.clk(clk),.arst(arst),.load(load),.PCsrc(PCsrc),.ImmExt(ImmExt),.Out(PC_Out));

    Instruction_Memory P2 
    (.Addr_sig(PC_Out),.Inst_sig(Inst));

    Reg_File P3
    (.clk(clk),.rst(arst),.A1(Inst[19:15]),.A2(Inst[24:20]),.A3(Inst[11:7]),.WD3(WD3),.RD1(RD1),.RD2(RD2),.WE(WE_REG));

    Sign_Extend P4
    (.ImmSrc(ImmSrc),.In_ex(Inst[31:7]),.ImmExt(ImmExt));

    Mux P5 
    (.a(RD2),.b(ImmExt),.sel(AluSrc),.Out(scrB));

    ALU P6
    (.srcA(RD1),.srcB(scrB),.ALUCONTROL(ALUCONTROL),.ALUresult(ALURESULT),.Zero_flag(Zero_flag),.SIGN_flag(SIGN_flag));

    Data_Memory P7
    (.clk(clk),.WE(WE_MEM),.A(ALURESULT),.WD(RD2),.RD(Read_Data));
    
    Mux P8
    (.a(ALURESULT),.b(Read_Data),.sel(R_src),.Out(WD3));

    Control_Unit P9
    (.op(Inst[6:0]),
    .funct3(Inst[14:12]),
    .funct7(Inst[30]),
    .Sign(SIGN_flag),
    .Zero(Zero_flag),
    .PCsrc(PCsrc),
    .Resultsrc(R_src),
    .MemWrite(WE_MEM),
    .AluSrc(AluSrc),
    .RegWrite(WE_REG),
    .ImmSrc(ImmSrc),
    .AluControl(ALUCONTROL));




endmodule
