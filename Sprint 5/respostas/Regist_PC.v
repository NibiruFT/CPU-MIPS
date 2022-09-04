module PC(input clk, input [7:0] PCin,
					output reg [7:0] PC);
	always @(posedge clk) begin
		PC <= PCin;
	end
endmodule
	