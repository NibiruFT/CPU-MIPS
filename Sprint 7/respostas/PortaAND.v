module PortaAND(input [7:0] Ent0, Ent1,
					output[7:0] Sai);			
	assign Sai = Ent0 & Ent1;
endmodule