# BookTrack

## Descrição do Projeto
BookTrack tem como objetivo criar uma aplicação web que permita aos usuários acompanhar seu progresso de leitura de livros e histórias em quadrinhos e registrar as suas leituras atuais. Esse projeto é desenvolvido como parte do curso de MAC0350 ministrada em 2024.1. 

### Disclaimer
Esse projeto foi criado com apoio das seguintes documentações do Ktor e modificado conforme a necessidade:
- [Create, open and run a new Ktor project](https://ktor.io/docs/server-create-a-new-project.html)
- [Create a website in Kotlin with Ktor](https://ktor.io/docs/server-create-website.html)
- [Integrate a database with Kotlin, Ktor, and Exposed](https://ktor.io/docs/server-integrate-database.html)

## Funcionalidades principais
- **Registro de Livros:** Os usuários podem adicionar livros à sua lista, especificando detalhes como título, autor, etc.
- **Acompanhamento de Progresso:** Os usuários podem marcar a página ou capítulo em que estão atualmente na sua leitura e, ao termina-la, podem marcar o livro como "lido".
- - **Comentários:** Os usuários podem adicionar comentários aos livros que estão lendo.

## Funcionalidades extras (backlog)
- **Avaliações:** Os usuários podem adicionar notas de 1 a 5 para os livros.

## Tecnologias Utilizadas
- **Frontend:** FreeMarker (HTML) e CSS.
- **Backend:** Kotlin, Ktor.
- **Banco de Dados:** PostgreSQL com framework Exposed.

## Documentação do projeto
A documentação do projeto pode ser encontrada na [Wiki do repositório](https://github.com/clair-de-lume/BookTrack/wiki).

## Instalação e Uso
1. Clone este repositório:
```
git clone https://github.com/clair-de-lume/BookTrack.git
```
2. Abra o projeto no Intellij (recomendado) ou na IDE de sua escolha
3. Em um terminal, faça a build do projeto com o comando:
```
.\gradlew.bat build
```
3.1. Para rodar com hot-reload, faça a build do projeto com o comando:
```
.\gradlew.bat -t build
```
4. Rode o projeto com:
```
\gradlew.bat run
```
5. Abra o projeto em seu navegador em `http://localhost:3000`
## Licença
Este projeto é licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).
