# SPRINT 6 LEONARDO GOUVÊA ROBOT-FRAMEWORK

## Como obter os arquivos deste repositório
```
git clone https://github.com/LeoGRibeiro/Sprint6_Leonardo_Gouvea/tree/DEVELOP
```
## Librarys necessárias:
- OperatingSystem
- RequestsLibrary
- Collections
- FakerLibrary

## Como executar os testes:
1 - Inserir no CMD
  ```
  npx serverest
  ```
2 - Na pasta Robot_Framework, rodar o arquivo **configs.py**, para preparar a Api

3 - Abrir o caminho da pasta baixada no CMD, e executar as seguintes linhas de código
- Para executar os cenários de login:
```
robot -d ./reports ./tests/login_tests.robot
```
- Para executar os cenários de usuarios:
```
robot -d ./reports ./tests/usuarios_tests.robot
```
- Para executar os cenários de produtos:
```
robot -d ./reports ./tests/produtos_tests.robot
```
- Para executar os cenários de carrinhos:
```
robot -d ./reports ./tests/carrinhos_tests.robot
```
- Caso queira executar todos de uma vez:
```
robot -d ./reports ./tests/serverest_tests.robot
```
4 - Você também pode executar algum cenário separadamente desta forma:
```
robot -d ./reports -i "NOME_DA_TAG" ./tests/serverest_tests.robot 
```
Você deve substituir "NOME_DA_TAG" pelas tags presentes nos cenários, Ex:
```
robot -d ./reports -i POST_carrinho_dinamico ./tests/carrinhos_tests.robot
```
