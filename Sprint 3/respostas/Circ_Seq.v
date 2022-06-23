module Circ_Seq(input [3:0]wa3, input we3, clk, input [7:0]wd3,
					output reg [7:0] D0, D1, D2, D3, D4, D5, D6, D7);
	always @(posedge clk) begin
		if(we3 == 1) begin
			case (wa3)
				0 : 
					D0 = wd3;
				1 :
					D1 = wd3;
				2 : 
					D2 = wd3;
				3 : 
					D3 = wd3;
				4 : 
					D4 = wd3;
				5 : 
					D5 = wd3;
				6 : 
					D6 = wd3;
				7 : 
					D7 = wd3;
			endcase
		end
	end
endmodule
	