package com.booktrack.dao

import com.booktrack.models.Book
import com.booktrack.dao.DatabaseSingleton.dbQuery
import com.booktrack.models.Books
import kotlinx.coroutines.runBlocking
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq

class DAOFacadeImpl : DAOFacade {
    private fun resultRowToBook(row: ResultRow) = Book(
        id = row[Books.id],
        title = row[Books.title],
        author = row[Books.author],
        cover = row[Books.cover],
        currentPage = row[Books.currentPage],
        page = row[Books.page],
        finished = row[Books.finished],
    )

    override suspend fun allBooks(): List<Book> = dbQuery {
        Books.selectAll().map(::resultRowToBook)
    }

    override suspend fun book(id: Int): Book? = dbQuery {
        Books
            .select { Books.id eq id }
            .map(::resultRowToBook)
            .singleOrNull()
    }

    override suspend fun addNewBook(
        title: String,
        author: String,
        cover: String,
        currentPage: Int,
        page: Boolean,
        finished: Boolean
    ): Book? = dbQuery {
        val insertStatement = Books.insert {
            it[Books.title] = title
            it[Books.author] = author
            it[Books.cover] = cover
            it[Books.currentPage] = currentPage
            it[Books.page] = page
            it[Books.finished] = finished
        }
        insertStatement.resultedValues?.singleOrNull()?.let(::resultRowToBook)
    }

    override suspend fun editBook(id: Int,
        title: String,
        author: String,
        cover: String,
        currentPage: Int,
        page: Boolean,
        finished: Boolean
    ): Boolean = dbQuery {
            Books.update({ Books.id eq id }) {
                it[Books.title] = title
                it[Books.author] = author
                it[Books.cover] = cover
                it[Books.currentPage] = currentPage
                it[Books.page] = page
                it[Books.finished] = finished
            } > 0
        }

    override suspend fun deleteBook(id: Int): Boolean = dbQuery {
        Books.deleteWhere { Books.id eq id } > 0
    }
}

val dao: DAOFacade = DAOFacadeImpl().apply {
    runBlocking {
        if(allBooks().isEmpty()) {
            addNewBook("Piranesi",
                "Suzanne Clarke",
                "",
                50,
                page = true,
                finished = false
            )
        }
    }
}