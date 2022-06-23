module ULA (input [7:0] SrcA, SrcB, input [2:0] ULAControl,
				output reg [7:0] ULAResult, output flagZ);				
	always @*begin		
		case(ULAControl)				
			3'b000 : 					
				ULAResult = SrcA & SrcB;				
			3'b001 :					
				ULAResult = SrcA | SrcB;				
			3'b010 : 					
				ULAResult = SrcA + SrcB;				
			3'b110 : 					
				ULAResult = SrcA - SrcB;				
			3'b111 : 					
				ULAResult = (SrcA < SrcB)? 1:0;		
		endcase		
		if(ULAResult == 0) begin			
			flagZ = 1;		
		end			
		else				
			flagZ = 0;	
endendmodule

				