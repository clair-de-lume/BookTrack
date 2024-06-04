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
        </div>
    </body>
</html>