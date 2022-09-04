# Sprint 3 - Banco de Registradores

> **Descrição geral do problema**: Implemente um banco com 8 registradores de 8 bits. Esse banco deverá possuir um barramento de escrita síncrono (dados + endereço) e dois barramentos de leitura combinacionais (dados + endereços)
> 
> **Nota 1**: [Vídeo Explicativo](https://youtu.be/6_5oKYGEvMg) feito pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/images/Sprint3%20-%20Banco%20de%20registradores%20-%20CPU%20MIPS.pdf)

# Respostas

4. Meu circuito foi dividido em duas partes uma sequencial e uma combinacional, como indicado na Figura abaixo: <p align="center"><img src="https://raw.githubusercontent.com/NibiruFT/CPU-MIPS/main/Sprint%203/images/Resposta.png"></a></p>
	- A resposta foi dividida em dois módulos principais:
		- [Circuito Sequencial](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/respostas/Circ_Seq.v);
		- [Circuito Combinacional](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/respostas/Circ_Comb.v);
		- e no Mod_Teste foi instanciado o Módulo [RegisterFile](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/respostas/RegisterFile.v).
