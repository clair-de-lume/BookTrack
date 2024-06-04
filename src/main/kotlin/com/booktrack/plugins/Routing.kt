package com.booktrack.plugins

import com.booktrack.dao.dao
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
                // call.respond(FreeMarkerContent("index.ftl", mapOf("books" to books)))
                call.respond(FreeMarkerContent("index.ftl", mapOf("books" to dao.allBooks())))
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
                val page = formParameters.getOrFail("page").toBoolean()
                val finished = formParameters.getOrFail("finished").toBoolean()

                val book = dao.addNewBook(title, author, cover, currentPage, page, finished)
                call.respondRedirect("/booktrack/${book?.id}")
            }
            get("{id}") {
                // Show a book with a specific id
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("show.ftl", mapOf("book" to dao.book(id))))
            }
            get("{id}/edit") {
                // Show a page with fields for editing a book
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("edit.ftl", mapOf("book" to dao.book(id))))
            }
            post("{id}") {
                // Update a book
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val formParameters = call.receiveParameters()
                when (formParameters.getOrFail("_action")) {
                    "update" -> {
                        val title = formParameters.getOrFail("title")
                        val author = formParameters.getOrFail("author")
                        val cover = formParameters.getOrFail("cover")
                        val currentPage = formParameters.getOrFail("currentPage").toInt()
                        val page = formParameters.getOrFail("page").toBoolean()
                        val finished = formParameters.getOrFail("finished").toBoolean()

                        dao.editBook(id, title, author, cover, currentPage, page, finished)
                        call.respondRedirect("/booktrack/$id")
                    }
                    "delete" -> {
                        dao.deleteBook(id)
                        call.respondRedirect("/")
                    }
                }
            }
        }
    }
}
