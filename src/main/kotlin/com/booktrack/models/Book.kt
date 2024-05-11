package com.booktrack.models

import java.util.concurrent.atomic.AtomicInteger

class Book
private constructor(val id: Int,
                    var title: String,
                    var author: String,
                    var cover: String,
                    var currentPage: Int,
                    var finished: Boolean) {
    companion object {
        private val id = AtomicInteger()

        fun newEntry(title: String, author: String, cover: String, currentPage: Int, finished: Boolean) =
            Book(id.getAndIncrement(), title, author, cover, currentPage, finished)
    }
}

val books = mutableListOf(Book.newEntry(
    "Piranesi",
    "Susanna Clarke",
    "https://m.media-amazon.com/images/I/81C1Y25irCL._AC_UF1000,1000_QL80_.jpg",
    36,
    false
))