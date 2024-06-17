<#--noinspection HtmlFormInputWithoutLabel-->
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
                            <label for="page">
                                <input type="radio" name="page" value="true" required checked>
                                Página
                            </label>
                            <label for="page">
                                <input type="radio" name="page" value="false" required>
                                Capítulo
                            </label>
                        </p>
                        <p class="form_input">
                            <input type="number" name="currentPage" required>
                        </p>
                        <p class="form_input">
                            <label for="finished">
                                <input type="radio" name="finished" value="false" required checked>
                                Não
                            </label>
                            <label for="page">
                                <input type="radio" name="finished" value="true" required>
                                Sim
                            </label>
                        </p>
                    </div>
                </div>
                <p style="text-align: center">
                    <input class="pagina"  type="submit">
                </p>
            </form>
            <p style="padding-top: 10px; text-align: center">
                <a class="pagina" style="text-decoration: none" href="/">Voltar para página inicial</a>
            </p>
        </div>

    </body>
</html>