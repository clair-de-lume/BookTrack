package com.booktrack.models

import java.util.concurrent.atomic.AtomicInteger

class Book

private constructor(val id: Int,
                    var title: String,
                    var author: String,
                    var cover: String,
                    var currentPage: Int,
                    var isPage: String,
                    var finished: Boolean,
                    var messageStatus: String) {

    fun updateStatus(finished: Boolean, currentPage: Int, isPage: String) {
        if (finished) { this.messageStatus = "Lido" }
        else { this.messageStatus = isPage + " $currentPage"
        }
        this.finished = finished
    }

    companion object {
        private val id = AtomicInteger()

        fun newEntry(title: String, author: String, cover: String, currentPage: Int, isPage: String, finished: Boolean, messageStatus: String) =
            Book(id.getAndIncrement(), title, author, cover, currentPage, isPage, finished, messageStatus)
    }
}

val books = mutableListOf(Book.newEntry(
    "Piranesi",
    "Susanna Clarke",
    "https://m.media-amazon.com/images/I/81C1Y25irCL._AC_UF1000,1000_QL80_.jpg",
    36,
    "Página",
    false,
    "Página 36"
))