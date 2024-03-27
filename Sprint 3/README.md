# Sprint 3 - Bank of Registers

> **General description of the problem**: Implement a bank with 8 8-bit registers. This bank must have a synchronous write bus (data + address) and two combinational read buses (data + address).
> 
> **Nota 1**: [Video](https://youtu.be/6_5oKYGEvMg) (Portuguese) by Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/images/Sprint3%20-%20Banco%20de%20registradores%20-%20CPU%20MIPS.pdf) (Portuguese)

# Code

4. My circuit was divided into two parts, one sequential and one combinational, as shown in the figure below: <p align="center"><img src="https://raw.githubusercontent.com/NibiruFT/CPU-MIPS/main/Sprint%203/images/Resposta.png"></a></p>
	- The response was divided into two main modules:
		- [Sequencial Circuit](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/respostas/Circ_Seq.v);
		- [Combinational Circuit](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/respostas/Circ_Comb.v);
		- and in Mod_Test the Module was instantiated [RegisterFile](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%203/respostas/RegisterFile.v).
