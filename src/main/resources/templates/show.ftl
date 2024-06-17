<#-- @ftlvariable name="book" type="com.booktrack.models.Book" -->
<#import "_layout.ftl" as layout />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BookTrack</title>
        <@layout.page_title />
    </head>

    <body>
        <@layout.page_header />

        <div style="text-align: center">
            <div>
                <#if book.cover == "">
                    <img height="150px" src="/static/booktrack_icon.png" alt="">
                <#else>
                    <img height="300px" src="${book.cover}" alt="">
                </#if>
                <h3 class="titulo"> ${book.title} </h3>
                <p class="autor"> ${book.author} </p>

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
            <p style="padding-top: 10px">
                <a class="pagina" style="text-decoration: none" href="/">Voltar para página inicial</a>
            </p>
        </div>
    </body>
</html>