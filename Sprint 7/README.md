# Sprint 7 – Detour instructions

> **General description of the problem**: Modify the PC's feedforward circuit to include the conditional (BEQ) and unconditional (J) bypass instructions. (BEQ) and unconditional (J) instructions.
> 
> **Note 1**: [Video](https://www.youtube.com/watch?v=O593XZox_K0&t=1s) (Portuguese) by Prof. Rafael.
> 
> **Note 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/images/Sprint7%20-%20Desvios%20-%20CPU%20MIPS.pdf)

# Code

1. Following the configurations shown in Figure 1:
  - Module [Adder Branch](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/Adder_Branch.v);
  - Module [MuxPCSrc](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/MuxPCSrc.v);
  - Module [MuxJump](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/MuxJump.v);
  - Module [AND Gate](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/PortaAND.v);
  - Module [Mod_Teste](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/Mod_Teste.v);

2. To make it easier to create new programs, use the executable
MIPS_Assembler2.exe executable to convert your assembly code to machine code.

  - Copy the executable from [LINK](https://drive.google.com/file/d/1Dcdsc8Fy5DYD08BKTSllc-cblkXqqHu4/view) to the local folder of your project.
