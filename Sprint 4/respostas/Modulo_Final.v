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
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------
wire[7:0] D0, D1, D2, D3, D4, D5, D6, D7;
wire [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3;

RegisterFile MyFile(.wa3(SW[16:14]), .clk(KEY[1]), .ra1(SW[13:11]), .wd3(SW[7:0]),						  
						  .rd1(w_rd1SrcA),.rd2(w_rd2));
MuxULASrc M1(.D1(8'h07), .D0(w_rd2), .S(SW[17]), .SrcB(w_SrcB));
ULA U1(.SrcA(w_rd1SrcA), .SrcB(w_SrcB), .ULAControl(SW[10:8]),        
		 .ULAResult(w_d0x4[7:0]), .flagZ(LEDG[0]));

assign w_d0x0[7:0] = w_rd1SrcA;
assign w_d1x0[7:0] = w_rd2;
assign w_d1x1[7:0] = w_SrcB;
assign LEDG[8] = KEY[1];
hexto7segment hex0(.x(SW[3:0]), .z(HEX0[0:6]));hexto7segment hex1(.x(SW[7:4]), .z(HEX1[0:6]));

endmodule

module RegisterFile (input [3:0] wa3, ra1, ra2, input[7:0]wd3, input we3, clk, output [7:0] rd1,rd2);	
	wire[7:0]D0, D1, D2, D3, D4, D5, D6, D7;	
	Circ_Seq S1(wa3, 1'b1, clk, wd3, D0, D1, D2, D3, D4, D5, D6, D7);	
	Circ_Comb C1(ra1, 3'b010, D0, D1, D2, D3, D4, D5, D6, D7, rd1, rd2);
endmodule