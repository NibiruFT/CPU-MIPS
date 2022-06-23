# Sprint 1 - Primeiro Projeto no Quartus II

> **Descrição geral do problema**: Criar o primeiro projeto no Quartus II e implementar uma Unidade Lógica e Aritmética (ULA) com 2 operações. Soma e Subtração.
> 
> **Nota 1**: [Vídeo Explicativo](https://www.youtube.com/watch?v=bxOywhFKAqA&t=5s) pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%201/images/Sprint_1.pdf)
 
1. Setup do ambiente de trabalho:
	- Crie o diretório **"c:\Quartus_II\Projeto"**;
	- b) Abra o Quartus II 13.0; 
	- c) Menu **“File -> New Project Wizard”**; 
	- d) Crie o Projeto, com nome **“Mod_Teste”**, no seu diretório; 
	- e) Ignore o pedido de inclusão de arquivos já existentes; 
	- f) Selecione a família **Cyclone II**, FPGA **EP2C35F672C6** e finish; 
	- g) Copie os seguintes arquivos, da pasta [code](https://github.com/NibiruFT/CPU-MIPS/tree/main/Sprint%201/code), para a pasta local do seu projeto: 
		- **Mod_Teste.v, LCD_TEST2.v, LCD_CONTROLLER.v e DE2_PIN_ASSIGNMENT.CSV** 
	- h) Use o menu **“Assignments > import assignment”** para incluir o arquivo **DE2_PIN_ASSIGNMENT.CSV** 
	- i) Adicione, em seu projeto, os arquivos **.v** do passo g). Na janela **“Project Navigator > Files > Botão direito > Add Remove files in project”**. Selecione os arquivos, Add All e OK
2. Dentro do módulo **Mod_Teste**, faça uma atribuição contínua entre o `LEDG[0]` e o botão `KEY[1]`. Compile , carregue na placa e teste seu primeiro código!
3. Implemente um circuito somador/subtrator de 4bits (ULA com 2 operações) 
	- a) O circuito deve possuir duas entradas de operandos de 4bits, conectadas as chaves `SW[3:0]` e `SW[7:4]`, uma entrada de seleção de operação, conectada a chave `SW[17]` e uma saída de 4bits para o resultado, conectada aos `LEDR[3:0]`. A lógica de operação da ULA é resumida na tabela 1.

		|Entrada de seleção de Operação (**SW[17]**)|Saída do resultado (**LEDR[3:0]**)|
		|-|-|
		|0|**SW[3:0]+SW[7:4]**|
		|1|**SW[3:0]-SW[7:4]**|

	- b) **Fica a seu critério**: 
		- Modelar o circuito em nível de portas lógicas ou subir o nível de abstração? 
		- Implementar com atribuição contínua ou procedural? 
		- Criar um módulo ou implementar diretamente no Mod_Teste? 
		- Teste diferentes formas!
	- c) Deve ser um circuito combinacional.
	- d) **Roteiro de testes**: 
		- i. 4’d3 + 4’d1 = ______ (decimal) ou ______ (binário) 
		- ii. 4’d15 + 4’d2 = ______ (decimal) ou ______ (binário) 
		- iii. 4’d7 - 4’d3 = ______ (decimal) ou ______ (binário) 
		- iv. 4’d7 - 4’d8 = ______ (decimal) ou ______ (binário)

# Respostas

2. [Primeiro Código](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%201/respostas/Primeiro_Codigo.v)
3. [Circuito Somador/Subtrator](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%201/respostas/Somador_Subtrator.v)
