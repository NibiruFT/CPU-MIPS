# Sprint 5 - Unidade de Controle

> **Descrição geral do problema**: Implemente a Unidade de Controle, uma memória ROM de instruções e o registrador PC. Esses novos blocos possibilitarão rodar 6 tipos de instruções em assembly de MIPS.
> 
> **Nota 1**: [Vídeo Explicativo](https://www.youtube.com/watch?v=uuh8hP0sY2c) pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Sprint5%20-%20Unidade%20de%20controle%20-%20CPU%20MIPS.pdf)

1. Faça a descrição de hardware, em Verilog, da Unidade de Controle indicada na figura 1. Esse módulo gera os sinais de controle para cada uma das instruções suportadas pela CPU.<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Decod_UC.png?raw=true"></a></p>
	- A arquitetura MIPS prevê 3 tipos de instruções R, I e J. A regra de formação do código de máquina de cada tipo de instrução está ilustrada na Tabela 2. Perceba que cada uma das instruções pode ser unicamente identificada pela combinação dos campos OP e funct. As instruções do tipo R tem OP igual a zero e são diferenciadas pelo campo funct. Já instruções do tipo I e J, dependem somente do OP.<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Cod_Maquina.png?raw=true"></a></p>
2. Faça a descrição de hardware, em Verilog, do Registrador PC (Program Counter). Tal componente é um registrador de 8 bits com uma entrada para carregamento paralelo (PCin) e uma saída paralela (PC).<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/PC.png?raw=true"></a></p>
3. O último elemento a ser implementado é a memória de instruções. Nessa sprint, deverá ser implementada uma memória ROM de instruções puramente combinacional, com até 256 posições de 32 bits. A sequência de instruções (programa) que será executada pela CPU, é armazenada na memória de instruções.<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Programa_Teste.png?raw=true"></a></p>
4. A fim de completar a primeira versão da nossa CPU v0.1, todos os módulos desenvolvidos até agora devem ser instanciados e conectados conforme o circuito da Figura 4.
	- Os fios devem ser criados com uma nomenclatura lógica para facilitar o entendimento geral do circuito e facilitar o debug; 
	- Essa CPU v0.1 será capaz de rodar as instruções ADD, SUB, AND, OR, SLT e ADDi; 
	- Ao término da última sprint, a CPU será capaz de rodar as 10 instruções da Tabela:<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Instr_MIPS.png?raw=true"></a></p><p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/CPU_v01.png?raw=true"></a></p>
	- Os fios utilizados na montagem da Figura 4, estão resumidos na Tabela 5:<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Fios_Montagem.png?raw=true"></a></p>
5. Ligações auxiliares para Debug: 
	- Faça uma pequena alteração no módulo RegisterFile. Crie 8 saídas auxiliares para visualizar externamente os valores de cada um dos registradores. Ao instanciar o módulo, faça as seguintes ligações: .S0(w_d0x0), .S1(w_d0x1), .S2(w_d0x2), .S3(w_d0x3), .S4(w_d1x0), .S5(w_d1x1), .S6(w_d1x2), .S7(w_d1x3). Nesse caso, o LCD deverá ficar conforme a Figura 5. 
	- Mostre também o PC, na posição w_d0x4 do LCD. (assign) 
	- Visualize os 8 sinais de controle gerados pelo módulo “Control Unit” nos LEDs vermelhos. LEDR[9:0]. (assign)<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Placa.png?raw=true"></a></p>
6. O circuito proposto tem quantas entradas externas? Rode o programa da Tabela 3 e diga qual o conteúdo dos registradores ao finalizá-lo:<p align="center"><img src="https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%205/images/Teste_Final.png?raw=true"></a></p>

