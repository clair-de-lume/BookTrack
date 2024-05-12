package com.booktrack.plugins

import com.booktrack.models.Book
import com.booktrack.models.books
import io.ktor.server.application.*
import io.ktor.server.freemarker.*
import io.ktor.server.http.content.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import io.ktor.server.util.*

fun Application.configureRouting() {
    routing {
        staticResources("/static", "static")

        get("/") {
            call.respondRedirect("booktrack")
        }
        route("booktrack") {
            get {
                // Show a list of books
                call.respond(FreeMarkerContent("index.ftl", mapOf("books" to books)))
            }
            get("new") {
                // Show a page with fields for creating a new book
                call.respond(FreeMarkerContent("new.ftl", model = null))
            }
            post {
                // Save a book
                val formParameters = call.receiveParameters()
                val title = formParameters.getOrFail("title")
                val author = formParameters.getOrFail("author")
                val cover = formParameters.getOrFail("cover")
                val currentPage = formParameters.getOrFail("currentPage").toInt()
                val isPage = formParameters.getOrFail("isPage")

                val newEntry = Book.newEntry(title, author, cover, currentPage, isPage, false)
                books.add(newEntry)
                call.respondRedirect("/booktrack/${newEntry.id}")
            }
            get("{id}") {
                // Show a book with a specific id
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("show.ftl", mapOf("book" to books.find { it.id == id })))
            }
            get("{id}/edit") {
                // Show a page with fields for editing a book
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("edit.ftl", mapOf("book" to books.find { it.id == id })))
            }
            post("{id}") {
                // Update a book
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val formParameters = call.receiveParameters()
                when (formParameters.getOrFail("_action")) {
                    "update" -> {
                        val index = books.indexOf(books.find { it.id == id })
                        val title = formParameters.getOrFail("title")
                        val author = formParameters.getOrFail("author")
                        val cover = formParameters.getOrFail("cover")
                        val currentPage = formParameters.getOrFail("currentPage").toInt()
                        val isPage = formParameters.getOrFail("isPage")

                        books[index].title = title
                        books[index].author = author
                        books[index].cover = cover
                        books[index].currentPage = currentPage
                        books[index].isPage = isPage
                        call.respondRedirect("/booktrack/$id")
                    }
                }
            }
        }
    }
}
