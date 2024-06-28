package com.booktrack

import com.booktrack.dao.DAOFacade
import com.booktrack.dao.DAOFacadeImpl
import com.booktrack.models.*

import kotlinx.coroutines.runBlocking
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.transactions.transaction

import org.junit.*
import kotlin.test.*
import kotlin.test.Test

class CommentIntegrationTest {
    private val dao: DAOFacade = DAOFacadeImpl()

    @Before
    fun createTestTable() {
        Database.connect(
            url = "jdbc:h2:mem:test;DB_CLOSE_DELAY=-1;",
            driver = "org.h2.Driver"
        )
        transaction {
            SchemaUtils.create(Books)
            SchemaUtils.create(Comments)
        }
        runBlocking {
            dao.addNewBook(
                "Livro 1",
                "Autor 1",
                "",
                50,
                page = true,
                finished = false
            )
            dao.addNewComment(
                1,
                "conteúdo do comentário 1"
            )
            dao.addNewComment(
                1,
                "conteúdo do comentário 2"
            )
        }
    }

    @After
    fun deleteTestTable() {
        transaction {
            SchemaUtils.drop(Books)
            SchemaUtils.drop(Comments)
        }
    }

    // Book database tests
    @Test
    fun `check if get all comments work`() = runBlocking {
        val comments = dao.allBookComments(1)
        assertEquals("conteúdo do comentário 1", comments[0].content)
        assertEquals("conteúdo do comentário 2", comments[1].content)
    }

    @Test
    fun `check if getting a specific comment works`() = runBlocking {
        val comment = dao.comment(2)
        assertEquals("conteúdo do comentário 2", comment?.content)
    }

    @Test
    fun `check if new comment is added correctly`() = runBlocking {
        val newComment = dao.addNewComment(1, "conteúdo do comentário 3")
        val comments = dao.allBookComments(1)
        assertEquals("conteúdo do comentário 3", comments[2].content)
        assertEquals("conteúdo do comentário 3", newComment?.content)
    }

    @Test
    fun `check if comment is edited correctly`() = runBlocking {
        val commentBeforeEdit = dao.comment(1)
        assertEquals("conteúdo do comentário 1", commentBeforeEdit?.content)

        dao.editComment(1, "novo conteúdo do comentário 1")

        val commentAfterEdit = dao.comment(1)
        assertEquals("novo conteúdo do comentário 1", commentAfterEdit?.content)
    }

    @Test
    fun `check if comment is deleted correctly`() = runBlocking {
        dao.deleteComment(1)
        val deletedComment = dao.comment(1)
        assertNull(deletedComment)
    }

    @Test
    fun `check if deleting a comment deletes another comment`(): Unit = runBlocking {
        dao.deleteComment(1)
        val remainingComment = dao.comment(2)
        assertNotNull(remainingComment)
    }
}
