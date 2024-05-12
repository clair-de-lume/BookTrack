<#-- @ftlvariable name="books" type="kotlin.collections.List<com.booktrack.models.Book>" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <#list books?reverse as book>
        <div>
            <img height="300px" src="${book.cover}" alt="">
            <h3> ${book.title} </h3>
            <p> ${book.author} </p>
            <p> ${book.messageStatus} </p>

            <p> <a href="/booktrack/${book.id}/edit">Editar livro</a> </p>
        </div>
    </#list>
    <hr>
    <p>
        <a href="/booktrack/new">Adicionar novo livro</a>
    </p>
</@layout.header>