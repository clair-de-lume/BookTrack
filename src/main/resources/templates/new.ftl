<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>Adicionar livro</h3>
        <form action="/booktrack" method="post">
            <p>
                <label for="title">Título:</label>
                <input type="text" name="title">
            </p>
            <p>
                <label for="author">Autor:</label>
                <input type="text" name="author">
            </p>
            <p>
                <label for="cover">Capa (link):</label>
                <input type="text" name="cover">
            </p>
            <p>
                <input type="radio" name="isPage" value="Página">
                <label for="isPage">Página</label>
                <input type="radio" name="isPage" value="Capítulo">
                <label for="isPage">Capítulo</label>
            </p>
            <p>
                <label for="currentPage">Página/Capítulo atual:</label>
                <input type="number" name="currentPage">
            </p>
            <p>
                <input type="submit">
            </p>
        </form>
        <p>
            <a href="/">Voltar para página inicial</a>
        </p>
    </div>
</@layout.header>