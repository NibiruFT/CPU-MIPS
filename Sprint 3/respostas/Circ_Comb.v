module Circ_Comb (input [3:0] ra1, ra2, input [7:0] D0, D1, D2, D3, D4, D5, D6, D7 ,
						output reg [7:0] rd1, rd2);
	always @*begin
		case(ra1)
				0 : 
					rd1 = D0;
				1 :
					rd1 = D1;
				2 : 
					rd1 = D2;
				3 : 
					rd1 = D3;
				4 : 
					rd1 = D4;
				5 : 
					rd1 = D5;
				6 : 
					rd1 = D6;
				7 : 
					rd1 = D7;
		endcase
		case(ra2)
				0 : 
					rd2 = D0;
				1 :
					rd2 = D1;
				2 : 
					rd2 = D2;
				3 : 
					rd2 = D3;
				4 : 
					rd2 = D4;
				5 : 
					rd2 = D5;
				6 : 
					rd2 = D6;
				7 : 
					rd2 = D7;
		endcase
	end	
endmodule	
		
				