package com.booktrack.dao

import com.booktrack.models.*

interface DAOFacade {
    suspend fun allBooks(): List<Book>
    suspend fun book(id: Int): Book?
    suspend fun addNewBook(title: String,
                           author: String,
                           cover: String,
                           currentPage: Int,
                           isPage: Boolean,
                           finished: Boolean): Book?
    suspend fun editBook(id: Int,
                         title: String,
                         author: String,
                         cover: String,
                         currentPage: Int,
                         isPage: Boolean,
                         finished: Boolean): Boolean
    suspend fun deleteBook(id: Int): Boolean
}