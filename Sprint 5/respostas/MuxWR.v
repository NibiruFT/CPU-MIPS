module MuxWR(input [2:0]Ent1, Ent0, input S, 
					  output reg[2:0] Sai);	
	always @*begin
		if(S == 0) begin
			Sai = Ent0;
		end	
		else	
			Sai = Ent1; 
	end
endmodule