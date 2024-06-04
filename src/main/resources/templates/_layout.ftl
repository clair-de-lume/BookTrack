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
                            <label for="page">Selecione modo de acompanhamento de leitura:</label>
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
                            <input type="radio" name="page" value="true" required checked>
                            <label for="page">Página</label>
                            <input type="radio" name="page" value="false" required>
                            <label for="page">Capítulo</label>
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

        <p style="text-align: center">
            <a class="pagina" style="text-decoration: none" href="/">Voltar</a>
        </p>
    </div>
</#macro>

<#macro edit_book>
    <div>
        <h3 style="text-align: center">Editar livro</h3>
        <form action="/booktrack/${book.id}" method="post">
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
                        <input type="text" name="title" value="${book.title}" required>
                    </p>
                    <p class="form_input">
                        <input type="text" name="author" value="${book.author}" required>
                    </p>
                    <p class="form_input">
                        <input type="text" name="cover" value="${book.cover}">
                    </p>
                    <p class="form_input">
                        <#if book.page>
                            <input type="radio" name="page" value="true" required checked>
                            <label for="page">Página</label>
                            <input type="radio" name="page" value="false" required>
                            <label for="page">Capítulo</label>
                        <#else>
                            <input type="radio" name="page" value="true" required>
                            <label for="page">Página</label>
                            <input type="radio" name="page" value="false" required checked>
                            <label for="page">Capítulo</label>
                        </#if>
                    </p>
                    <p class="form_input">
                        <input type="number" name="currentPage" value="${book.currentPage}" required>
                    </p>
                    <p class="form_input">
                    <#if book.finished>
                        <input type="radio" name="finished" value="false" required>
                        <label for="finished">Não</label>
                        <input type="radio" name="finished" value="true" required checked>
                        <label for="finished">Sim</label>
                    <#else>
                        <input type="radio" name="finished" value="false" required checked>
                        <label for="finished">Não</label>
                        <input type="radio" name="finished" value="true" required>
                        <label for="finished">Sim</label>
                    </#if>
                    </p>
                </div>
            </div>

            <div style="text-align: center; display: inline">
                <p>
                    <input class="pagina" type="submit" name="_action" value="update">
                </p>
                <p>
                    <input class="pagina" type="submit" name="_action" value="delete">
                </p>
            </div>
        </form>
    <p style="text-align: center">
        <a class="pagina" style="text-decoration: none" href="/">Voltar</a>
    </p>
</#macro>

<#macro show_book>
    <div style="text-align: center">
        <div>
            <#if book.cover == "">
                <img height="150px" src="/static/booktrack_icon.png" alt="">
            <#else>
                <img height="300px" src="${book.cover}" alt="">
            </#if>
            <h3 class="titulo"> ${book.title} </h3>
            <p class="autor"> ${book.author} </p>
            <#if book.finished>
                <p> <b>Lido</b> </p>
            <#elseif book.page>
                <p> <b>Página ${book.currentPage}</b> </p>
            <#else>
                <p> <b>Capítulo ${book.currentPage}</b> </p>
            </#if>
        </div>

        <p>
            <a class="pagina" style="text-decoration: none" href="/booktrack/${book.id}/edit">Editar livro</a>
        </p>
        <p>
            <a class="pagina" style="text-decoration: none" href="/">Voltar para página inicial</a>
        </p>
    </div>
</#macro>