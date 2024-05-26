package com.booktrack.models

import java.util.concurrent.atomic.AtomicInteger
import org.jetbrains.exposed.sql.*

data class Book(val id: Int,
    val title: String,
    val author: String,
    val cover: String,
    val currentPage: Int,
    var finished: Boolean,)

object Books : Table() {
    val id = integer("id").autoIncrement()
    val title = varchar("title", 128)
    val author = varchar("author", 128)
    val cover = varchar("cover", 128)
    val currentPage = integer("currentPage")
    val finished = bool("finished")

    override val primaryKey = PrimaryKey(id)
}

