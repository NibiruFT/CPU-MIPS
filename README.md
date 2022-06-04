# CPU-MIPS
Implementação, em verilog, de uma CPU MIPS de ciclo único totalmente funcional. A CPU será capaz de rodar, no mínimo, 10 instruções em assembly. Com isso, você poderá programa-la em assembly ou até em C. 

### Quartus Instalação
> A instalação do simulador é gratis e pode ser feita através do link [Intel® Quartus® II](https://www.intel.com/content/www/us/en/software-kit/711791/intel-quartus-ii-web-edition-design-software-version-13-0sp1-for-windows.html).
>
>  **Nota**: O simulador é pesado e pode rodar extramamente lento dependendo do seu PC.

### Sprint 1

1. Setup do ambiente de trabalho individual:
  * Crie o diretório “c:\Quartus_II”. Cada aluno deverá usar o mesmo computador em todas as aulas do LASD. Sempre salvar seus arquivos nessa pasta;
  * Abra o Quartus II 13.0;
  * Menu “File -> New Project Wizard”;
  * Crie o Projeto, com nome “Mod_Teste”, no seu diretório;
  * Ignore o pedido de inclusão de arquivos já existentes;
  * Selecione a família CycloneII, FPGA EP2C35F672C6 e finish;
  * Copie os seguintes arquivos, do google classroom, para a pasta local do seu projeto: Mod_Teste.v, LCD_TEST2.v, LCD_CONTROLLER.v e DE2_PIN_ASSIGNMENT.CSV
  * Use o menu “Assignments > import assignment” para incluir o arquivo DE2_PIN_ASSIGNMENT.CSV
  * Adicione, em seu projeto, os arquivos .v do passo g). Na janela “Project Navigator > Files > Botão direito > Add Remove files in project”. Selecione os arquivos, Add     All e OK.
  Obs: Nas aulas subsequentes devemos abrir este projeto usando “File > Open Project” e NÃO “File >
      Open”.
