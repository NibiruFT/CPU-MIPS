`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1,
 
output TD_RESET,	//	TV Decoder Reset

// VGA
  output VGA_CLK,   						//	VGA Clock
  output VGA_HS,							//	VGA H_SYNC
  output VGA_VS,							//	VGA V_SYNC
  output VGA_BLANK,						//	VGA BLANK
  output VGA_SYNC,						//	VGA SYNC
  output [9:0] VGA_R,   				//	VGA Red[9:0]
  output [9:0] VGA_G,	 				//	VGA Green[9:0]
  output [9:0] VGA_B   					//	VGA Blue[9:0]

);

//	All inout port turn to tri-state
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;

assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;

LCD_TEST 			u5	(	
	
							//	Host Side
							.iCLK  	( CLOCK_50 ),
							.iRST_N	( KEY[0] ),
							
							.d000 (d000),		//		P		
							.d001 (d001),		//		r		
							.d002 (d002),		//		i		
							.d003 (d003),		//		m		
							.d004 (d004),		//		e		
							.d005 (d005),		//		i		
							.d006 (d006),		//		r		
							.d007 (d007),		//		a		
							.d008 (d008),		//		 		
							.d009 (d009),		//		L		
							.d010 (d010),		//		i		
							.d011 (d011),		//		n		
							.d012 (d012),		//		h		
							.d013 (d013),		//		a		
							.d014 (d014),		//		!		
							.d015 (d015),		//		 		
							
							.d100 (d100),		//		~	
							.d101 (d101),		//		S		
							.d102 (d102),		//		e		
							.d103 (d103),		//		g		
							.d104 (d104),		//		u		
							.d105 (d105),		//		n		
							.d106 (d106),		//		d		
							.d107 (d107),		//		a		
							.d108 (d108),		//				
							.d109 (d109),		//		L		
							.d110 (d110),		//		i		
							.d111 (d111),		//		n	
							.d112 (d112),		//		h		
							.d113 (d113),		//		a		
							.d114 (d114),		//		!		
							.d115 (d115),		//		 		
							
							//	LCD Side
							
							.LCD_DATA( LCD_DATA ),
							.LCD_RW  ( LCD_RW ),
							.LCD_EN	( LCD_EN ),
							.LCD_RS  ( LCD_RS )	
							);					
							
wire [7:0] d000,d001,d002,d003,d004,d005,d006,d007,d008,d009,d010,d011,d012,d013,d014,d015,d100,d101,d102,d103,d104,d105,d106,d107,d108,d109,d110,d111,d112,d113,d114,d115;
	

//--------------------------- Projeto-----------------------------------------
wire RST;
assign RST = KEY[0];

// reset delay gives some time for peripherals to initialize
wire DLY_RST;
Reset_Delay r0(	.iCLK(CLOCK_50),.oRESET(DLY_RST) );

wire [6:0] blank = 7'b111_1111;

wire		VGA_CTRL_CLK;
wire		AUD_CTRL_CLK;
wire [9:0]	mVGA_R;
wire [9:0]	mVGA_G;
wire [9:0]	mVGA_B;
wire [9:0]	mCoord_X;
wire [9:0]	mCoord_Y;
wire [7:0]  Reg[8:0];

assign	TD_RESET = 1'b1; // Enable 27 MHz

VGA_Audio_PLL 	p1 (	
	.areset(~DLY_RST),
	.inclk0(CLOCK_27),
	.c0(VGA_CTRL_CLK),
	.c1(AUD_CTRL_CLK),
	.c2(VGA_CLK)
);

wire [9:0] r, g, b;
bars c1(w_d0x2,w_d0x3, mCoord_X, mCoord_Y, r, g, b);

assign mVGA_R = r;
assign mVGA_G = g;
assign mVGA_B = b;

vga_sync u1(
   .iCLK(VGA_CTRL_CLK),
   .iRST_N(DLY_RST&KEY[0]),	
   .iRed(mVGA_R),
   .iGreen(mVGA_G),
   .iBlue(mVGA_B),
   // pixel coordinates
   .px(mCoord_X),
   .py(mCoord_Y),
   // VGA Side
   .VGA_R(VGA_R),
   .VGA_G(VGA_G),
   .VGA_B(VGA_B),
   .VGA_H_SYNC(VGA_HS),
   .VGA_V_SYNC(VGA_VS),
   .VGA_SYNC(VGA_SYNC),
   .VGA_BLANK(VGA_BLANK)
);

//-----------------------------------------------------------------------

wire [7:0] w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_wd3, w_RData, w_m1, w_nPC, w_PCBranch, w_RegData, w_DataIn, w_DataOut;
wire [31:0] w_Inst;
wire w_ULASrc, w_RegWrite, w_RegDst, w_MemtoReg, w_MemWrite, CLK, w_PCSrc, w_Jump, w_Branch, w_Z, w_We;
wire [2:0] w_ULAControl, w_wa3;

div_freq(.clk_50MHz(CLOCK_50), .clk_1Hz(CLK));
Adder1(.Ent(w_PC), .Sai(w_PCp1));
AdderBranch(.Ent0(w_PCp1), .Ent1(w_Inst[7:0]), .Sai(w_PCBranch));
PC(.clk(CLK), .PCin(w_nPC), .PC(w_PC));

RegisterFile(.wa3(w_wa3), .ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]), .wd3(w_wd3), .we3(w_RegWrite), .clk(CLK),
						 .rd1(w_rd1SrcA), .rd2(w_rd2), .D0(w_d0x0), .D1(w_d0x1), .D2(w_d0x2), .D3(w_d0x3), .D4(w_d1x0), .D5(w_d1x1), .D6(w_d1x2), .D7(w_d1x3));
Uni_Controle (.OP(w_Inst[31:26]), .Funct(w_Inst[5:0]), 
						.RegWrite(w_RegWrite), .RegDst(w_RegDst), .ULASrc(w_ULASrc), .Branch(w_Branch), .MemWrite(w_MemWrite), .MemtoReg(w_MemtoReg), .Jump(w_Jump), .ULAControl(w_ULAControl));
PortaAND(.Ent0(w_Branch), .Ent1(w_Z), .Sai(w_PCSrc));
ULA(.SrcA(w_rd1SrcA), .SrcB(w_SrcB), .ULAControl(w_ULAControl), .ULAResult(w_ULAResultWd3), .flagZ(w_Z));

MuxULASrc(.Ent0(w_rd2), .Ent1(w_Inst[7:0]), .S(w_ULASrc), .Sai(w_SrcB));
MuxWR(.Ent0(w_Inst[20:16]), .Ent1(w_Inst[15:11]), .S(w_RegDst), .Sai(w_wa3));
MuxDDest(.Ent0(w_ULAResultWd3), .Ent1(w_RegData), .S(w_MemtoReg), .Sai(w_wd3));
MuxPCSrc(.Ent0(w_PCp1), .Ent1(w_PCBranch), .S(w_PCSrc), .Sai(w_m1));
MuxJump(.Ent0(w_m1), .Ent1(w_Inst[7:0]), .S(w_Jump), .Sai(w_nPC));

RomInstMem (.clock(CLOCK_50), .address(w_PC), .q(w_Inst));		
RamDataMem (.address(w_ULAResultWd3), .data(w_rd2), .q(w_RData), .clock(CLOCK_50), .wren(w_We));

Parallel_OUT (.RegData(w_rd2), .address(w_ULAResultWd3), .clock(CLK), .we(w_MemWrite), .wren(w_We), .DataOut(w_DataOut)); 
Parallel_IN (.MemData(w_RData), .address(w_ULAResultWd3), .RegData(w_RegData), .DataIn(w_DataIn)); 

assign w_DataIn = SW[7:0];

//Configura as linhas  do Display LCD convertendo os valores para código ASCII:

	//Linha superior
assign d000 = 32;	// P	
assign d001 = 32;	//	L
assign d002 = 32;	// A		
assign d003 = 32;	//	Y	
assign d004 = 32;	// E				
assign d005 = 32;	//	R	
assign d006 = 32;	//	S	
assign d007 = 32;	//	:		
assign d008 = 32;	//	A	
assign d009 = 32;//	x			
assign d010 = 32;	//	B	
assign d011 = 8'h20;				
assign d012 = 8'h20;				
assign d013 = 8'h20;			
assign d014 = 8'h20;				
assign d015 = 8'h20;			
	
	//Linha inferior
assign d100 = 32;	//	P
assign d101 = 32;	//	L		
assign d102 = 32; //	A	
assign d103 = 32;	//	C	
assign d104 = 32;	//	A
assign d105 = 32;	//	R		
assign d106 = 32;	//	:		
assign d107 = 32;				
assign d108 = 32;	//Pontuação Player A		
assign d109 = 32; // x			
assign d110 = 32;	//Pontuação Player B			
assign d111 = 32;		
assign d112 = 32;
assign d113 = 32;	
assign d114 = 32;
assign d115 = 32;

assign LEDG[8] = CLK;
endmodule

module RegisterFile (input [2:0] wa3, ra1, ra2, input[7:0]wd3, input we3, clk, output [7:0] rd1,rd2, D0, D1, D2, D3, D4, D5, D6, D7);
	Circ_Seq S1(wa3, we3, clk, wd3, D0, D1, D2, D3, D4, D5, D6, D7);
	Circ_Comb C1(ra1, ra2, D0, D1, D2, D3, D4, D5, D6, D7, rd1, rd2);
endmodule
