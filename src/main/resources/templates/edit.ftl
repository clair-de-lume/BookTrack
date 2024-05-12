<#-- @ftlvariable name="book" type="com.booktrack.models.Book" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>Editar livro</h3>
        <form action="/booktrack/${book.id}" method="post">
            <p>
                <label for="title">Título:</label>
                <input type="text" name="title" value="${book.title}" required>
            </p>
            <p>
                <label for="author">Autor:</label>
                <input type="text" name="author" value="${book.author}">
            </p>
            <p>
                <label for="cover">Capa (link):</label>
                <input type="text" name="cover" value="${book.cover}">
            </p>
            <p>
                <input type="radio" name="isPage" value="Página" required>
                <label for="isPage">Página</label>
                <input type="radio" name="isPage" value="Capítulo" required>
                <label for="isPage">Capítulo</label>
            </p>
            <p>
                <label for="currentPage">Página/Capítulo atual:</label>
                <input type="number" name="currentPage" value="${book.currentPage}" required>
            </p>
            <p>
                <input type="submit" name="_action" value="update">
            </p>
        </form>
    </div>
    <p>
        <a href="/">Voltar para página inicial</a>
    </p>
</@layout.header>