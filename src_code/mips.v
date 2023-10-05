module mips(clk, reset,OpCode,ALUOp,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump,Bne);
//main cpu module

input clk;
input reset;

output [5:0] OpCode;

output [1:0] ALUOp;

output RegDst;
output ALUSrc;
output MemToReg;
output RegWrite;
output MemRead;
output MemWrite;
output Branch;
output Jump;
output Bne;

datapath Datapath(clk,reset,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump,Bne,ALUOp,OpCode);

control Control(OpCode,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump,Bne,ALUOp); 

endmodule
