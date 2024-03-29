module Uni_Controle (input [5:0] OP, Funct, 
							output reg RegWrite, RegDst, ULASrc, Branch, MemWrite, MemtoReg, Jump, output reg [2:0] ULAControl);
	always @*begin
		case(OP)
				6'b000000 : begin
					case(Funct) 
						6'b100000: begin //ADD
							RegWrite = 1; RegDst = 1; ULASrc = 0; ULAControl = 3'b010; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
						           end
						6'b100010: begin //SUB
							RegWrite = 1; RegDst = 1; ULASrc = 0; ULAControl = 3'b110; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
										end
						6'b100100: begin //AND
							RegWrite = 1; RegDst = 1; ULASrc = 0; ULAControl = 3'b000; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
										end
						6'b100101: begin //OR
							RegWrite = 1; RegDst = 1; ULASrc = 0; ULAControl = 3'b001; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
										end
						6'b101010: begin //SLT
							RegWrite = 1; RegDst = 1; ULASrc = 0; ULAControl = 3'b111; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
										end
					endcase
							end
				6'b100011 : begin //LW
					RegWrite = 1; RegDst = 0; ULASrc = 1; ULAControl = 3'b010; Branch = 0; MemWrite = 0; MemtoReg = 1; Jump = 0;
								end
				6'b101011 : begin //SW
					RegWrite = 0; ULASrc = 1; ULAControl = 3'b010; Branch = 0; MemWrite = 1; Jump = 0;
								end
				6'b000100 : begin //BEQ
					RegWrite = 0; ULASrc = 0; ULAControl = 3'b110; Branch = 1; MemWrite = 0; Jump = 0;
								end
				6'b001000 : begin //ADDi
					RegWrite = 1; RegDst = 0; ULASrc = 1; ULAControl = 3'b010; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
								end
				6'b001100 : begin //ANDi
					RegWrite = 1; RegDst = 0; ULASrc = 1; ULAControl = 3'b000; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
								end
				6'b000010 : begin //J
					RegWrite = 0; MemWrite = 0; Jump = 1;
								end		
		endcase
	end	
endmodule	
		

		