<#-- @ftlvariable name="books" type="kotlin.collections.List<com.booktrack.models.Book>" -->
<#import "_layout.ftl" as layout />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>BookTrack</title>
    <@layout.page_title />
</head>

<body>
    <@layout.page_header />

    <#list books?reverse as book>
        <div class="livros">
            <#if book.cover == "">
                <img height="150px" src="/static/booktrack_icon.png" alt="">
            <#else>
                <img height="300px" src="${book.cover}" alt="">
            </#if>

            <div style="max-width: 200px">
                <h3 class="titulo"> ${book.title} </h3>
                <p class="autor"> ${book.author} </p>
            </div>

            <div style="display: inline-flex">
                <#if book.finished>
                    <p class="pagina"> <b>Lido</b> </p>
                <#elseif book.page>
                    <p class="pagina"> <b>Página ${book.currentPage}</b> </p>
                <#else>
                    <p class="pagina"> <b>Capítulo ${book.currentPage}</b> </p>
                </#if>
                <a class="editarLivro" href="/booktrack/${book.id}/edit"> <i class="fa fa-pencil-square-o" aria-hidden="true" ></i></a>
            </div>
        </div>
    </#list>
    <hr>
    <p style="text-align: center">
        <a class="pagina" style="text-decoration: none" href="/booktrack/new">Adicionar novo livro</a>
    </p>
</body>
</html>


