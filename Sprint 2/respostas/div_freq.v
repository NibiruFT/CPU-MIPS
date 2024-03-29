module div_freq(input clk_50MHz, output reg clk_1Hz);
	reg [24:0] res;
	always @(posedge clk_50MHz) begin
		res <= res + 1;
		if(res == 250000)
			begin	
				res <= 0;
				clk_1Hz <= !clk_1Hz;
			end
	end	
endmodule