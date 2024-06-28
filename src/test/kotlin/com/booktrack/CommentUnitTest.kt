package com.booktrack

import com.booktrack.models.Comment
import org.junit.Test
import kotlin.test.*

class CommentUnitTest {
    private val comment = Comment(
        1,
        2,
        "conteúdo do comentário 1"
    )

    @Test
    fun commentBookIdTest() {
        assertEquals(2, comment.bookId)
    }

    @Test
    fun commentContentTest() {
        assertEquals("conteúdo do comentário 1", comment.content)
    }

    @Test
    fun commentContentFailTest() {
        assertNotEquals("não é o conteúdo do comentário 1", comment.content)
    }
}