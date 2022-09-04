module bars(input [7:0]D1, D2, input [9:0] x, input [9:0] y,
	output reg[9:0] red, output reg[9:0] green, output reg[9:0] blue);
		
always @(x,y)
begin
	//Quadrado
	if((x > (320-256/2) && x<(320+256/2) && (y == (240-256/2) || y == (240+256/2))) || y >(240-256/2) && y < (240+256/2) && (x == (320-256/2) || x == (320+256/2))) begin
			red = 10'h3ff;
			green = 10'h3ff;
			blue = 10'h3ff;
			end
	//Linha 1		
	else if (x > (320-256/2) && x <(320+256/2) && (y ==   197)) begin
			red = 10'h3ff;
			green = 10'h3ff;
			blue = 10'h3ff;
			end
	//Linha 2		
	else if (x > (320-256/2) && x <(320+256/2) && (y ==  282)) begin
			red = 10'h3ff;
			green = 10'h3ff;
			blue = 10'h3ff;
			end
	//Coluna 1		
	else if (y >(240-256/2) && y < (240+256/2) && (x ==  277)) begin
			red = 10'h3ff;
			green = 10'h3ff;
			blue = 10'h3ff;
			end
	//Coluna 2		
	else if (y >(240-256/2) && y < (240+256/2) && (x ==   362)) begin
			red = 10'h3ff;
			green = 10'h3ff;
			blue = 10'h3ff;
			end
			//----------------------AZUL------------------------
	//Quadrado 1_1
	else if (y >(112) && y < (197) && x > (277-85) && x <(362-85) && D1[0]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end	
	//Quadrado 1_2		
	else if (y >(112) && y < (197) && x > (277) && x <(362) && D1[1]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end		
	//Quadrado 1_3
	else if (y >(112) && y < (197) && x > (277+85) && x <(362+86) && D1[2]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end	
	//Quadrado 2_1		
	else if (y >(112+85) && y < (197+85) && x > (277-85) && x <(362-85) && D1[3]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end		
	//Quadrado 2_2
	else if (y >(112+85) && y < (197+85) && x > (277) && x <(362)) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end		
	//Quadrado 2_3
	else if (y >(112+85) && y < (197+85) && x > (277+85) && x <(362+86) && D1[4]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end	
	//Quadrado 3_1	
	else if (y >(112+85+85) && y < (197+85+86) && x > (277-85) && x <(362-85) && D1[5]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end		
	//Quadrado 3_2
	else if (y >(112+85+85) && y < (197+85+86) && x > (277) && x <(362) && D1[6]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end	
	//Quadrado 3_3	
	else if (y >(112+85+85) && y < (197+85+86) && x > (277+85) && x <(362+86) && D1[7]) begin
			red = 10'h000;
			green = 10'h000;
			blue = 10'h3ff;
			end			
			//----------------------VERMELHO------------------------
	//Quadrado 1_1
	else if (y >(112) && y < (197) && x > (277-85) && x <(362-85) && D2[0]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;
			end	
	//Quadrado 1_2		
	else if (y >(112) && y < (197) && x > (277) && x <(362) && D2[1]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;
			end		
	//Quadrado 1_3
	else if (y >(112) && y < (197) && x > (277+85) && x <(362+86) && D2[2]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;
			end	
	//Quadrado 2_1		
	else if (y >(112+85) && y < (197+85) && x > (277-85) && x <(362-85) && D2[3]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;
			end		
	//Quadrado 2_2
//	else if (y >(112+85) && y < (197+85) && x > (277) && x <(362) && D == 8'h25) begin
//			red = 10'h3ff;
//			green = 10'h000;
//			blue = 10'h000;
//			end		
	//Quadrado 2_3
	else if (y >(112+85) && y < (197+85) && x > (277+85) && x <(362+86) && D2[4]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;
			end	
	//Quadrado 3_1	
	else if (y >(112+85+85) && y < (197+86+85) && x > (277-85) && x <(362-85) && D2[5]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;;
			end		
	//Quadrado 3_2
	else if (y >(112+85+85) && y < (197+86+85) && x > (277) && x <(362) && D2[6]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;
			end	
	//Quadrado 3_3	
	else if (y >(112+85+85) && y < (197+86+85) && x > (277+85) && x <(362+86) && D2[7]) begin
			red = 10'h3ff;
			green = 10'h000;
			blue = 10'h000;
			end			
	else begin
		red = 10'h000;
		green = 10'h000;
		blue = 10'h000;
		end		
end

endmodule