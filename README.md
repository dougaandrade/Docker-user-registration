# Projeto: Castrastro de Usuários (user-registration) - NodeJS/Express

### O que é? 📒

Página web para cadastro de usuários desenvolvido em NodeJS/Express .

### Objetivo 📋

1. O principal objetivo desse projeto é sua utilização em containers.
2. Criação de Dockerfiles configurando cada ambiente especifico.
3. Aprendizado do funcionamento do Docker.

### Execução ⚙️

Para cumprir o objetivo e executar esse projeto:
1. Crie uma network personalizada utilizando o driver Bridge.
2. Configure um container do MongoDB na porta 27017 e insira-o na rede personalizada criada no passo anterior.
3. Crie um Dockerfile para a aplicação em NodeJS expondo a porta 3000 e uma variável MONGODB contendo o nome do container do MongoDB para que haja comunicação. Em seguida inicialize um container para a aplicação na network criada no passo 1.
4. Para visualizar os dados inseridos no banco, pode ser utilizado um container do Mongo Express.

### Comandos 💻

- Build do Mongodb
  
  ```bash
   ❯ docker build -t <nome da imagem:<versão>> -f mongodb.dockerfile .

- Build do Mongo-Express
  
  ```bash
  ❯ docker build -t <nome da imagem:<versão>> -f mongo-express.dockerfile . 

- Build da Aplicação (NodeJs)
  
  ```bash
   ❯ docker build -t <nome da imagem:<versão>> -f app.dockerfile .

- Build da Rede
  
  ```bash
  ❯ docker network create --driver bridge <nome da rede>

- Run do Container
  
  ```bash
  ❯ docker run -dit --name <nome do server declarado no express.dockerfile> -p 27017:27017 --network <nome da rede criada> --mount source=<nome do volume>,target=<volume declarado no mongodb> <nome do mongodb criado> 
  
- Run o Mongo-express
  
  ```bash
  ❯ docker run -dit -p 8081:8081 --network rede_app <nome da imagem express>
  
- Run o App
  
  ```bash
   ❯ docker run -dit -p 3000:3000 --network rede_app <nome da imagem da aplicação>
