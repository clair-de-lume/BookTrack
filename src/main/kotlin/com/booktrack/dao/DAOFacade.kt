package com.booktrack.dao

import com.booktrack.models.*

interface DAOFacade {
    //
    // BOOK CRUD FUNCTIONS
    //
    suspend fun allBooks(): List<Book>
    suspend fun book(id: Int): Book?
    suspend fun addNewBook(title: String,
                           author: String,
                           cover: String,
                           currentPage: Int,
                           page: Boolean,
                           finished: Boolean): Book?
    suspend fun editBook(id: Int,
                         title: String,
                         author: String,
                         cover: String,
                         currentPage: Int,
                         page: Boolean,
                         finished: Boolean): Boolean
    suspend fun deleteBook(id: Int): Boolean

    //
    // COMMENT CRUD FUNCTIONS
    //
    suspend fun allBookComments(bookId: Int): List<Comment>
    suspend fun comment(id: Int): Comment?
    suspend fun addNewComment(bookId: Int,
                              content: String): Comment?
    suspend fun editComment(id: Int,
                         content: String): Boolean
    suspend fun deleteComment(id: Int): Boolean
    suspend fun deleteAllBookComments(bookId: Int): Boolean
}