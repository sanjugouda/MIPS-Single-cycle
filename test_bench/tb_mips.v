module tb_mips;
//cpu testbench

reg clk;
reg res;

wire [5:0] OpCode;

wire [1:0] ALUOp;

wire RegDst;
wire ALUSrc;
wire MemToReg;
wire MemRead;
wire MemWrite;
wire Branch;
wire Jump;
wire Bne;

mips mips_DUT(clk, res,OpCode,ALUOp,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump,Bne);

initial
	forever #5 clk = ~clk;

initial begin
	clk = 0;
	res = 1;
	#10 res = 0;

	#3000 $finish;

end

endmodule
