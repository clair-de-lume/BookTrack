package com.booktrack.models

import org.jetbrains.exposed.sql.*

data class Comment(val id: Int,
                   val bookId: Int,
                   val content: String)

object Comments : Table() {
    val id = integer("id").autoIncrement()
    val bookId = integer("bookId")//.references(Books.id)
    val content = varchar("title", 128)

    override val primaryKey = PrimaryKey(id)
}