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

    </body>
</html>