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

class BookIntegrationTest {
    private val dao: DAOFacade = DAOFacadeImpl()

    @Before
    fun createTestTable() {
        Database.connect(
            url = "jdbc:h2:mem:test;DB_CLOSE_DELAY=-1;",
            driver = "org.h2.Driver"
        )
        transaction {
            SchemaUtils.create(Books)
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
            dao.addNewBook(
                "Livro 2",
                "Autor 2",
                "",
                50,
                page = false,
                finished = true
            )
            dao.addNewBook(
                "Livro 3",
                "Autor 2",
                "",
                50,
                page = false,
                finished = true
            )
        }
    }

    @After
    fun deleteTestTable() {
        transaction {
            SchemaUtils.drop(Books)
        }
    }

    // Book database tests
    @Test
    fun testAllBooks() = runBlocking {
        val books = dao.allBooks()
        assertEquals("Livro 1", books[0].title)
        assertEquals("Livro 2", books[1].title)
        assertEquals("Livro 3", books[2].title)
    }

    @Test
    fun testGetBook() = runBlocking {
        val book = dao.book(2)
        assertEquals("Livro 2", book?.title)
    }

    @Test
    fun testAddNewBook() = runBlocking {
        val newBook = dao.addNewBook("Piranesi",
            "Suzanne Clarke",
            "",
            50,
            page = false,
            finished = true)

        assertEquals("Piranesi", newBook?.title)
    }

    @Test
    fun testEditBook() = runBlocking {
        val bookBeforeEdit = dao.book(1)
        assertEquals("Livro 1", bookBeforeEdit?.title)

        dao.editBook(
                1,
                "Novo título",
                "Autor 1",
                "",
                50,
                page = true,
                finished = false)

        val bookAfterEdit = dao.book(1)
        assertEquals("Novo título", bookAfterEdit?.title)
    }

    @Test
    fun testDeleteBook() = runBlocking {
        dao.deleteBook(1)
        val deletedBook = dao.book(1)
        assertNull(deletedBook)
    }
}
