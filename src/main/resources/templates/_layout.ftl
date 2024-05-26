<#macro page_title>
    <title>BookTrack</title>
    <link rel="stylesheet" href="/static/main.css"/>
    <link rel="icon" type="image/x-icon" href="/static/booktrack_icon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</#macro>

<#macro page_header>
    <div class="header">
        <a href="/booktrack">
            <img class="icon" src="/static/booktrack_icon.png" alt="">
            <h1 class="title">BookTrack</h1>
        </a>
    </div>
    <hr>
</#macro>

<#macro page_body>

    <#list books?reverse as book>
        <div class="livros">
            <#if book.cover == "">
                <img height="150px" src="/static/booktrack_icon.png" alt="">
            <#else>
                <img height="300px" src="${book.cover}" alt="">
            </#if>

            <h3 class="titulo"> ${book.title} </h3>
            <p class="autor"> ${book.author} </p>

            <div style="display: inline-flex">
                <p class="pagina"> ${book.messageStatus} </p>
                <a class="editarLivro" href="/booktrack/${book.id}/edit"> <i class="fa fa-pencil-square-o" aria-hidden="true" ></i></a>
            </div>
        </div>
    </#list>
    <hr>
    <p>
        <a href="/booktrack/new">Adicionar novo livro</a>
    </p>
</#macro>

<#macro new_book>
    <div>
        <h3 style="text-align: center">Adicionar livro</h3>

        <form action="/booktrack" method="post">
            <div class="Parent">
                <div class="coluna1">
                        <p class="form_text">
                            <label for="title">Título:</label>
                        </p>
                        <p class="form_text">
                            <label for="author">Autor:</label>
                        </p>
                        <p class="form_text">
                            <label for="cover">Capa (link):</label>
                        </p>
                        <p class="form_text">
                            Selecione modo de acompanhamento de leitura:
                        </p>
                        <p class="form_text">
                            <label for="currentPage">Página/Capítulo atual:</label>
                        </p>
                        <p class="form_text"> Lido?
                        </p>
                </div>
                <div class="coluna2">
                        <p class="form_input">
                            <input type="text" name="title" required>
                        </p>
                        <p class="form_input">
                            <input type="text" name="author" required>
                        </p>
                        <p class="form_input">
                            <input type="text" name="cover">
                        </p>
                        <p class="form_input">
                            <input type="radio" name="isPage" value="Página" required checked>
                            <label for="isPage">Página</label>
                            <input type="radio" name="isPage" value="Capítulo" required>
                            <label for="isPage">Capítulo</label>
                        </p>
                        <p class="form_input">
                            <input type="number" name="currentPage" required>
                        </p>
                        <p class="form_input">
                            <input type="radio" name="finished" value="false" required checked>
                            <label for="finished">Não</label>
                            <input type="radio" name="finished" value="true" required>
                            <label for="finished">Sim</label>
                        </p>
                </div>
            </div>
            <p style="text-align: center">
                <input class="pagina"  type="submit">
            </p>

        </form>
        <p>
            <a href="/">Voltar para página inicial</a>
        </p>
    </div>
</#macro>

<#macro edit_book>
    <div>
        <h3>Editar livro</h3>
        <form action="/booktrack/${book.id}" method="post">
            <p>
                <label for="title">Título:</label>
                <input type="text" name="title" value="${book.title}" required>
            </p>
            <p>
                <label for="author">Autor:</label>
                <input type="text" name="author" value="${book.author}">
            </p>
            <p>
                <label for="cover">Capa (link):</label>
                <input type="text" name="cover" value="${book.cover}">
            </p>
            <p>
                <input type="radio" name="isPage" value="Página" required checked>
                <label for="isPage">Página</label>
                <input type="radio" name="isPage" value="Capítulo" required>
                <label for="isPage">Capítulo</label>
            </p>
            <p>
                <label for="currentPage">Página/Capítulo atual:</label>
                <input type="number" name="currentPage" value="${book.currentPage}" required>
            </p>
            <p> Lido?
                <input type="radio" name="finished" value="false" required checked>
                <label for="finished">Não</label>
                <input type="radio" name="finished" value="true" required>
                <label for="finished">Sim</label>
            </p>
            <p>
                <input type="submit" name="_action" value="update">
            </p>
        </form>
    </div>
    <div>
        <form action="/booktrack/${book.id}" method="post">
            <p>
                <input type="submit" name="_action" value="delete">
            </p>
        </form>
    </div>
    <p>
        <a href="/">Voltar para página inicial</a>
    </p>
</#macro>

<#macro show_book>
    <div>
        <img height="300px" src="${book.cover}" alt="">
        <h3> ${book.title} </h3>
        <p> ${book.author} </p>
        <p> ${book.messageStatus} </p>
    </div>
    <p>
        <a href="/booktrack/${book.id}/edit">Editar livro</a>
    </p>
    <p>
        <a href="/">Voltar para página inicial</a>
    </p>
</#macro>