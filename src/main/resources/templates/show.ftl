<#-- @ftlvariable name="book" type="com.booktrack.models.Book" -->
<#-- @ftlvariable name="comments" type="kotlin.collections.List<com.booktrack.models.Comment>" -->
<#import "_layout.ftl" as layout />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BookTrack</title>
        <@layout.page_title />
    </head>

    <body>
        <@layout.page_header />

            <div class="Parent">
                <div class="coluna1">
                    <div style="text-align: center">
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
                </div>
                <div class="coluna2">
                    <h2>Comentários</h2>
                        <#list comments as comment>
                            <div class="livros">
                                <a href="/booktrack/${book.id}/${comment.id}">
                                    <p class="comentario">${comment.content}</p>
                                </a>
                            </div>
                        </#list>

                    <div style="text-align: center">
                        <form action="/booktrack/${book.id}" method="post">
                            <p class="form_text">
                                <label for="comment">Comentário:</label>
                            </p>
                            <p class="form_input">
                                <textarea name="content" cols="50" rows="4" required></textarea>
                            </p>
                            <p style="text-align: center">
                                <input class="pagina" type="submit" name="_action" value="comment">
                            </p>
                        </form>
                    </div>
                </div>
            </div>

            <p style="padding-top: 10px; text-align: center">
                <a class="pagina" style="text-decoration: none" href="/">Voltar para página inicial</a>
            </p>
    </body>
</html>