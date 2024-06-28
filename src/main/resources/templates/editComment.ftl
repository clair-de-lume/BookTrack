<#-- @ftlvariable name="book" type="com.booktrack.models.Book" -->
<#-- @ftlvariable name="comment" type="com.booktrack.models.Comment" -->
<#--noinspection ALL-->
<#--noinspection HtmlFormInputWithoutLabel-->
<#--noinspection ALL-->
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
    <h3 style="text-align: center">Editar comentário</h3>
    <form action="/booktrack/${book.id}/${comment.id}" method="post">
        <div style="text-align: center">
            <textarea name="content" cols="50" rows="4" required>${comment.content}</textarea>
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
    <p style="padding-top: 10px; text-align: center">
        <a class="pagina" style="text-decoration: none" href="/">Voltar para página inicial</a>
    </p>
</div>
</body>
</html>