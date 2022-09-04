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

assign w_DataOut = w_d1x4;
assign w_DataIn = SW[7:0];
assign w_d0x4 = w_PC;
assign LEDR[0] = w_Jump;
assign LEDR[1] = w_MemtoReg;
assign LEDR[2] = w_MemWrite;
assign LEDR[3] = w_Branch;
assign LEDR[6:4] = w_ULAControl;
assign LEDR[7] = w_ULASrc;
assign LEDR[8] = w_RegDst;
assign LEDR[9] = w_RegWrite;
assign LEDG[0] = w_DataOut;
endmodule

module RegisterFile (input [2:0] wa3, ra1, ra2, input[7:0]wd3, input we3, clk, output [7:0] rd1,rd2, D0, D1, D2, D3, D4, D5, D6, D7);
	Circ_Seq S1(wa3, we3, clk, wd3, D0, D1, D2, D3, D4, D5, D6, D7);
	Circ_Comb C1(ra1, ra2, D0, D1, D2, D3, D4, D5, D6, D7, rd1, rd2);
endmodule
