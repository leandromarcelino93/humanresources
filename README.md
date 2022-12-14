## Apresentação 

Nesta oportunidade quis desempenhar um trabalho baseado em um tema que é muito conhecido da comunidade: o famoso CRUD (Create, Read, Update e Delete). Não se trata de um projeto mirabolante, mas a ideia era disponibilizar mesmo que de forma básica, as quatro funções presentes no acrônimo. O tema do projeto desta vez foi inspirado e voltado para o setor de recursos humanos. Abaixo temos uma demonstração da aplicação em funcionamento. 

## Demonstração 

![20221116_081432](https://user-images.githubusercontent.com/109693767/202172426-cf9cfc25-04cd-4596-87a5-3c739f723a90.gif)

Passo a passo: 
* **C** (Create): quando o usuário digita e salva seus dados;
* **R** (Read): ao fechar e abrir a aplicação novamente, temos a leitura;
* **U** (Update): ao digitar o mesmo nome e alterar somente a profissão e o número de registro, temos a atualização;
* **D** (Delete): e, por fim, ao clicar no ícone com o símbolo de subtração e atualizar a tela, vemos que o registro foi deletado. 

Obs: O GIF é um pouco longo e durante a pausa para fechar e abrir o aplicativo novamente, vai parecer que "travou", mas ainda há alguns segundos restantes de reprodução.

## O Desafio 

Aplicação dos conceitos de persistência de dados dentro de um projeto autoral. O projeto alcançou o seu objetivo principal: o armazenamento utilizando recurso interno de um dispositivo, conforme visto na demonstração acima: mesmo quando o usuário fecha a aplicação, ao abrir ela novamente, os seus dados gravados anteriormente ainda se encontram disponíveis e sendo possível manipulá-los. 

## :hammer_and_wrench:	Como rodar o projeto? 

* Preferencialmente, tenha uma IDE (Integrated Development Environment - Ambiente de desenvolvimento integrado) instalada em sua máquina, que pode ser Android Studio, IntelliJ ou VSCode. 
* Ter instalado a SDK do Flutter na versão 3.0.0
* Baixar o pacote do SQFlite versão ^2.0.3+1
