module MuxULASrc(input [7:0]D1, D0, input S, 
					  output reg[7:0] SrcB);	
	always @*begin
		if(S == 0) begin
			SrcB = D0;
		end	
		else	
			SrcB = D1; 
	end
endmodule