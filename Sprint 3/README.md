# Sprint 3 - Banco de Registradores

> **Descrição geral do problema**: Implemente um banco com 8 registradores de 8 bits. Esse banco deverá possuir um barramento de escrita síncrono (dados + endereço) e dois barramentos de leitura combinacionais (dados + endereços)
> 
> **Nota 1**: [Vídeo Explicativo](https://youtu.be/6_5oKYGEvMg) pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/images/Sprint3%20-%20Banco%20de%20registradores%20-%20CPU%20MIPS.pdf)

1. Faça a descrição de hardware de um módulo, denominado RegisterFile, que gere o circuito indicado na Figura 1, usando a linguagem Verilog.
	- O módulo apresenta as seguintes entradas e saídas: 
		- **Entradas**: 
			- Write Data (**wd3**) (8 bits) – Entrada de dados; 
			- Write Address (**wa3**) (3 bits) – Seleção do registrador que armazenará o dado proveniente de Write Data (wd3); 
			- Write Enable (**we3**) (1 bit) – Habilita (1) ou desabilita (0) a gravação de dados nos registradores de $0 a $7; 
			- **clk** (1 bit) – Se o sinal Write Enable (we3) está ativo (nível 1), na borda de subida do clock, o dado é gravado no registrador selecionado; 
			- Register Address 1 (**ra1**) (3 bits) – Seleção de qual registrador será disponibilizado na saída rd1; 
			- Register Address 2 (**ra2**) (3 bits) – Seleção de qual registrador será disponibilizado na saída rd2; 
		- Saídas: 
			- Register Data 1 (**rd1**) (8 bits) – Barramento de saída de 8 bits; 
			- Register Data 2 (**rd2**) (8 bits) – Barramento de saída de 8 bits;
2. Na instanciação no módulo “**Mod_Teste**” faça as seguintes conexões:
3. Visualize a entrada wd3 nos displays `HEX0` e `HEX1`, assim como conecte as saídas rd1 e rd2 respectivamente nas posições `d0x0` e `d0x1` do LCD. 
4. Para avaliar o funcionamento do circuito, realize a gravação de um conjunto de dados nos registradores. Após a gravação, verifique se os dados foram de fato gravados selecionando ra1 e ra2 e observando as saídas rd1 e rd2	

# Respostas

