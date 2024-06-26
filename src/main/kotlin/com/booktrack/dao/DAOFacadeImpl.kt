package com.booktrack.dao

import com.booktrack.models.Book
import com.booktrack.models.Comment
import com.booktrack.models.Books
import com.booktrack.models.Comments

import com.booktrack.dao.DatabaseSingleton.dbQuery
import kotlinx.coroutines.runBlocking
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq


class DAOFacadeImpl : DAOFacade {
    //
    // BOOK CRUD FUNCTIONS
    //
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

    //
    // COMMENT CRUD FUNCTIONS
    //
    private fun resultRowToComment(row: ResultRow) = Comment(
        id = row[Comments.id],
        bookId = row[Comments.bookId],
        content = row[Comments.content]
    )

    override suspend fun allBookComments(bookId: Int): List<Comment> = dbQuery {
        Comments.select { Comments.bookId eq bookId }.map(::resultRowToComment)
    }

    override suspend fun comment(id: Int): Comment? = dbQuery {
        Comments
            .select { Comments.id eq id }
            .map(::resultRowToComment)
            .singleOrNull()
    }

    override suspend fun addNewComment(bookId: Int,
                                       content: String): Comment? = dbQuery {
        val insertStatement = Comments.insert {
            it[Comments.bookId] = bookId
            it[Comments.content] = content
        }
        insertStatement.resultedValues?.singleOrNull()?.let(::resultRowToComment)
    }

    override suspend fun editComment(id: Int,
                                  content: String
    ): Boolean = dbQuery {
        Comments.update({ Comments.id eq id }) {
            it[Comments.content] = content
        } > 0
    }

    override suspend fun deleteComment(id: Int): Boolean = dbQuery {
        Comments.deleteWhere { Comments.id eq id } > 0
    }

    override suspend fun deleteAllBookComments(bookId: Int): Boolean = dbQuery {
        Comments.deleteWhere { Comments.bookId eq bookId } > 0
    }
}