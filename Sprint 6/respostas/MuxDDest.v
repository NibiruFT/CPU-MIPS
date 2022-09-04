module MuxDDest(input [7:0]Ent0, Ent1, input S, 
					  output reg[7:0] Sai);	
	always @*begin
		if(S == 0) begin
			Sai = Ent0;
		end	
		else	
			Sai = Ent1; 
	end
endmodule