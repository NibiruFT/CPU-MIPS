module cont_M10(input clk_1MHz, rst, output reg[0:4] z);
	always @(posedge clk_1MHz or negedge rst) begin
		if(rst == 0)
			z = 0;
		else if(z > 4)
				z <= 0;
		else
			z = z + 1;
	end	
endmodule