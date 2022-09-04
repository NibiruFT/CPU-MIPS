module Parallel_IN(input [7:0]MemData, address, DataIn, 
						output reg[7:0] RegData);	

	always @*begin
		if(address == 8'hFF) begin
			RegData = DataIn;
		end	
		else	
			RegData = MemData; 
	end
	
endmodule
