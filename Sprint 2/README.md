# Sprint 2 - Revisão de Verilog - Blocos Construtivos

> **Descrição geral do problema**: Criar o primeiro projeto no Quartus II e implementar uma Unidade Lógica e Aritmética (ULA) com 2 operações. Soma e Subtração.
> 
> **Nota 1**: [Vídeo Explicativo](https://www.youtube.com/watch?v=rih3KcWvHJA) pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%201/images/Sprint_1.pdf)
 
1. Faça um assign entre os leds do display de 7 segmentos `HEX0[0:6]` e as chaves `SW[6:0]`. Varie as chaves e observe qual segmento está associado a cada **wire** de `HEX0`.
2. Projete um decodificador de hexadecimal para 7 segmentos. 
	- a) Crie o decodificador em uma estrutura de módulo. Para facilitar o reuso, salve-o em um arquivo **.v** separado. 
	- b) O decodificador deve possuir uma entrada de 4bits, para entrar um número em hexa e uma saída de 7bits para conectar um display de 7 segmentos e poder visualizar o número. 
	- c) Para testar seu circuito, instancie um decodificador, no **Mod_Teste**, com o seguinte mapeamento de entradas e saídas:
	- d) Dica: pesquise sobre a estrutura case. Implemente a lógica de funcionamento em alto nível.
3. Implemente um módulo divisor de frequência para gerar um clock de 1Hz a partir do clock de 50MHz disponível na placa DE2 (CLOCK_50). 
	- a) Esse circuito é basicamente um contador de pulsos do clock de entrada, que inverte sua saída cada vez que uma condição é atingida. 
	- b) O divisor deve possuir uma entrada de 1bit de clock (rápido, 50MHz) e uma saída de 1bit de clock (lento, 1Hz). 
	- c) Para testar seu circuito, instancie um decodificador, no **Mod_Teste**, com o seguinte mapeamento de entradas e saídas:
4. Implemente um contador módulo 10 para varrer, ciclicamente, os números de 0 a 9. 
	- a) Esse circuito deve ter uma entrada de clock, uma entrada de reset e uma saída de contagem de 4 bits. A cada borda de subida do clock, a saída de contagem deve ser incrementada em uma unidade até que seu valor seja 9. Em um clock subsequente, a saída é zerada, reiniciando a contagem. Quando a entrada de reset estiver em nível baixo, o valor de contagem também é zerado.
	- b) Para testar seu módulo, implemente a seguinte montagem final, envolvendo todos os outros blocos implementados anteriormente:
	- c) Caso o seu circuito passe por todos os testes, chame o professor para receber sua nota. 
