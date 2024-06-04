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