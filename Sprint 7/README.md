# Sprint 7 – Desvios

> **Descrição geral do problema**: Modifique o circuito de avanço do PC para incluir as instruções de desvio
condicional (BEQ) e incondicional (J).
> 
> **Nota 1**: [Vídeo Explicativo](https://www.youtube.com/watch?v=O593XZox_K0&t=1s) pelo Prof. Rafael.
> 
> **Nota 2**: [PDF](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/images/Sprint7%20-%20Desvios%20-%20CPU%20MIPS.pdf)

# Respostas

1. Seguindo as configurações mostradas na Figura 1:
  - Módulo do [Adder Branch](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/Adder_Branch.v);
  - Módulo do [MuxPCSrc](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/MuxPCSrc.v);
  - Módulo do [MuxJump](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/MuxJump.v);
  - Módulo [Porta AND](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/PortaAND.v);
  - Módulo [Mod_Teste](https://github.com/NibiruFT/CPU-MIPS/blob/main/Sprint%207/respostas/Mod_Teste.v);

2. Para facilitar a criação de novos programas, utilize o executável
MIPS_Assembler2.exe para converter seus códigos de assembly para código de máquina.

  - Copie o executável desse [LINK](https://drive.google.com/file/d/1Dcdsc8Fy5DYD08BKTSllc-cblkXqqHu4/view) para a pasta local do seu projeto.
