module pclogic(clk, reset, ain, aout, pcsel,Branch,Jump,Bne,Zero,instruction);

input reset;
input clk;
input [31:0] ain;
//pecsel = branch & zero
input pcsel;
input Branch;
input Jump;
input [25:0] instruction;
input Bne,Zero;

reg [31:0] aout_q,aout_d;
output reg [31:0] aout;

always @(posedge clk ) begin
	if (reset==1)
		aout_q<=32'b0;
	else
		aout_q<=aout_d;
end

always @(*) begin
aout_d=aout_q ;
		if (Jump==1) begin
			aout_d=aout_q+1;
			aout_d={aout_d[31:28],instruction,2'b01};
		end
		else if ((pcsel)||(~Zero&&Bne)) begin  //bne
			aout_d=ain+aout_q;
		end

		else	aout_d=aout_q+1; //normal increment
end

assign aout=aout_q;
endmodule