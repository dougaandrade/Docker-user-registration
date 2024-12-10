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
  ```bash ❯ docker build -t mongodb -f mongodb.dockerfile .```
- Run do Mongodb com a Porta e Volume
  ```bash docker run -dit -p 27017:27017 --mount source=mongo-volume,target=/data/db --name mongodb mongodb```
  
- Build do Mongo-express com Argumento do IP
  ```bash ❯ docker build -t express-mongodb -f mongo-express.dockerfile --build-arg MONGO=$MONGOIP .```
- Após o build do Mongo-express dê um inspect no mongdb e depois exporte o ip passado
  ```bash export MONGOIP=172.17.0.2 ```
- Build do App.dockerfile com Argumento do IP
  ```bash ❯ docker build -t nodejs-app -f app.dockerfile --build-arg MONGO=$MONGOIP .```
- Run o Mongo-express
  ```bash ❯ docker run -dit -p 8081:8081 express-mongodb```
- Run o App
  ```bash docker run -dit -p 3000:3000 nodejs-app```
