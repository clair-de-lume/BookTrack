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
                <a href="/booktrack/${book.id}"><img src="/static/booktrack_icon.png" style="height: 150px"></a>
            <#else>
                <a href="/booktrack/${book.id}"><img src="${book.cover}" style="height: 300px" alt=""></a>
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
</body>
</html>


