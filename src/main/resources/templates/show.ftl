<#-- @ftlvariable name="book" type="com.booktrack.models.Book" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <img height="300px" src="${book.cover}" alt="">
        <h3> ${book.title} </h3>
        <p> ${book.author} </p>
        <p> Página ${book.currentPage} </p>
    </div>
    <p>
        <a href="/booktrack/${book.id}/edit">Editar livro</a>
    </p>
    <p>
        <a href="/">Voltar para página inicial</a>
    </p>
</@layout.header>