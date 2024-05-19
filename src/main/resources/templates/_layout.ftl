<#macro header>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>BookTrack</title>
        <link rel="stylesheet" href="/static/teste.css"/>
    </head>

    <body>
        <div class="header">
            <img style="display: inline-block" height="50px" src="/static/Open_Book_icon.png" alt="">
            <h1 style="display: inline-block; text-align: left">BookTrack</h1>
        </div>

    <#nested>
    </body>
    </html>
</#macro>

<#macro page_title>
    <title>BookTrack</title>
    <link rel="stylesheet" href="/static/teste.css"/>
    <link rel="icon" type="image/x-icon" href="/static/booktrack_icon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</#macro>

<#macro page_header>
    <div class="header">
        <img style="display: inline-block" height="50px" src="/static/booktrack_icon.png" alt="">
        <h1 style="display: inline-block; text-align: left">BookTrack</h1>
    </div>
</#macro>

<#macro page_body>
    <hr>
    <#list books?reverse as book>
        <div class="livros">
            <img height="300px" src="${book.cover}" alt="">
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