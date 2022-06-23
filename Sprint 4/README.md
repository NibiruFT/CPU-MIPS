# Sprint 4 - Unidade Lógica e Aritmética (ULA)

> **Descrição geral do problema**: Implemente uma ULA com 5 operações lógicas/aritméticas e associe-a às saídas do seu banco de registradores.
> 
> **Nota 1**: [Vídeo Explicativo](https://www.youtube.com/watch?v=0OlZwGGVd30) pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%204/images/Sprint4%20-%20ULA%20-%20CPU%20MIPS.pdf)

1. Faça a descrição de hardware de um módulo, denominado ULA, que realize 5 operações lógicas/aritméticas conforme a Tabela 1. As entradas e saídas do módulo são ilustradas na Figura 1, usando a linguagem Verilog.<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%204/images/Modulo_ULA.png?raw=true"></a></p>
	- Entradas: 
		- SrcA (8bits): Entrada de dados do operando A; 
		- SrcB (8bits): Entrada de dados do operando B; 
		- ULAControl (3bits): Entrada para seleção da operação realizada (ver Tabela 1). 
	- Saídas:
		- ULAResult (8bits): Saída do resultado da operação realizada; 
		- Flag Z (1bit): Bit de status que indica se a saída da operação realizada é zero (resultado igual a zero: Z=1; resultado diferente de zero: Z=0).
2. Instancie a ULA, o banco de registradores (implementado na sprint anterior) e um MUX de 2x1 de 8 bits, no seu ambiente de testes (Mod_Teste). A montagem completa é ilustrada na Figura 2. Observe que o MuxULASrc possibilita a entrada direta de constantes de 8 bits na entrada SrcB da ULA.
	- Devido à quantidade limitada de chaves na placa de testes, algumas entradas serão constantes.<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%204/images/Diagrama_Datapath.png?raw=true"></a></p>
3. Ligações auxiliares: 
	- Visualize o conteúdo do fio w_rd1SrcA na posição d0x0 do LCD;
	- Visualize o conteúdo do fio w_rd2 na posição d1x0 do LCD;
	- Visualize o conteúdo do fio w_SrcB na posição d1x1 do LCD;
	- Visualize o conteúdo do fio w_ULAResultWd3 na posição d0x4 do LCD.<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%204/images/Placa_Testes.png?raw=true"></a></p>
4. A fim de testar o funcionamento da ULA implementada realize os seguintes procedimentos:
	- Carregue os seguintes valores nos registradores: 
		- **$5 <- 06** 
		- **$2 <- 03**. 
	- Disponibilize os valores de $5 e $2 respectivamente nas entradas SrcA e SrcB da ULA; 
	- Efetue as operações: 
		- Add ____, Sub____, And____, Or____ e SLT____ 
	- Carregue o valor da Constant in (8’h07) na entrada SrcB da ULA; 
	- Efetue novamente as operações: 
		- Add ____, Sub____, And____, Or____ e SLT____ 
	- Verifique o funcionamento do flag Z.

# Respostas

2. Seguindo as configurações mostradas na Figura 2:
	- Módulo do [MUX](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%204/respostas/MuxULASrc.v);
	- Módulo da [ULA](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%204/respostas/ULA.v);
	- Módulo [Mod_Teste](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%204/respostas/Modulo_Final.v).
