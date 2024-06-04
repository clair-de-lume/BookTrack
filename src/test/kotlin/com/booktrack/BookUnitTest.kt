package com.booktrack

import com.booktrack.models.Book
import org.junit.Test
import kotlin.test.*

class BookUnitTest {
    private val book = Book(
        0,
        "Ulysses",
        "James Joyce",
        "",
        1,
        page = true,
        finished = false
    )

    @Test
    fun bookTitleTest() {
        assertEquals("Ulysses", book.title)
    }

    @Test
    fun bookAuthorTest() {
        assertEquals("James Joyce", book.author)
    }

    @Test
    fun bookCurrentPageTest() {
        assertEquals(1, book.currentPage)
    }

    @Test
    fun bookPageTest() {
        assertEquals(true, book.page)
    }

    @Test
    fun bookFinishedTest() {
        assertEquals(false, book.finished)
    }

    @Test
    fun bookTitleFailTest() {
        assertNotEquals("Ulisses", book.title)
    }
}