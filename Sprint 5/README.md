# Sprint 5 - Unidade de Controle

> **Descrição geral do problema**: Implemente a Unidade de Controle, uma memória ROM de instruções e o registrador PC. Esses novos blocos possibilitarão rodar 6 tipos de instruções em assembly de MIPS.
> 
> **Nota 1**: [Vídeo Explicativo](https://youtu.be/uuh8hP0sY2c) pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%201/images/Sprint_1.pdf)

1. Faça a descrição de hardware, em Verilog, da Unidade de Controle indicada na figura 1. Esse módulo gera os sinais de controle para cada uma das instruções suportadas pela CPU.
	- A arquitetura MIPS prevê 3 tipos de instruções R, I e J. A regra de formação do código de máquina de cada tipo de instrução está ilustrada na Tabela 2. Perceba que cada uma das instruções pode ser unicamente identificada pela combinação dos campos OP e funct. As instruções do tipo R tem OP igual a zero e são diferenciadas pelo campo funct. Já instruções do tipo I e J, dependem somente do OP.
2. Faça a descrição de hardware, em Verilog, do Registrador PC (Program Counter). Tal componente é um registrador de 8 bits com uma entrada para carregamento paralelo (PCin) e uma saída paralela (PC).
3. O último elemento a ser implementado é a memória de instruções. Nessa sprint, deverá ser implementada uma memória ROM de instruções puramente combinacional, com até 256 posições de 32 bits. A sequência de instruções (programa) que será executada pela CPU, é armazenada na memória de instruções.
4. A fim de completar a primeira versão da nossa CPU v0.1, todos os módulos desenvolvidos até agora devem ser instanciados e conectados conforme o circuito da Figura 4.
	- Os fios devem ser criados com uma nomenclatura lógica para facilitar o entendimento geral do circuito e facilitar o debug; 
	- Essa CPU v0.1 será capaz de rodar as instruções ADD, SUB, AND, OR, SLT e ADDi; 
	- Ao término da última sprint, a CPU será capaz de rodar as 10 instruções da Tabela:
	- Os fios utilizados na montagem da Figura 4, estão resumidos na Tabela 5:
5. Ligações auxiliares para Debug: 
	- Faça uma pequena alteração no módulo RegisterFile. Crie 8 saídas auxiliares para visualizar externamente os valores de cada um dos registradores. Ao instanciar o módulo, faça as seguintes ligações: .S0(w_d0x0), .S1(w_d0x1), .S2(w_d0x2), .S3(w_d0x3), .S4(w_d1x0), .S5(w_d1x1), .S6(w_d1x2), .S7(w_d1x3). Nesse caso, o LCD deverá ficar conforme a Figura 5. 
	- Mostre também o PC, na posição w_d0x4 do LCD. (assign) 
	- Visualize os 8 sinais de controle gerados pelo módulo “Control Unit” nos LEDs vermelhos. LEDR[9:0]. (assign)
6. O circuito proposto tem quantas entradas externas? Rode o programa da Tabela 3 e diga qual o conteúdo dos registradores ao finalizá-lo:

