package com.booktrack.plugins

import com.booktrack.dao.DAOFacadeImpl
import io.ktor.server.application.*
import io.ktor.server.freemarker.*
import io.ktor.server.http.content.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import io.ktor.server.util.*
import kotlinx.coroutines.runBlocking


fun Application.configureRouting() {
    routing {
        staticResources("/static", "static")
        val dao = DAOFacadeImpl()
        runBlocking {
            if (dao.allBooks().isEmpty()) {
                dao.addNewBook(
                    "A Redoma de Vidro",
                    "Sylvia Plath",
                    "https://m.media-amazon.com/images/I/719UtmEsIIL._AC_UF1000,1000_QL80_.jpg",
                    50,
                    page = true,
                    finished = false
                )
                dao.addNewBook(
                    "Piranesi",
                    "Suzanne Clarke",
                    "",
                    7,
                    page = true,
                    finished = true
                )
                dao.addNewComment(1, "Uma narrativa emocionante.")
            }
        }

        get("/") {
            call.respondRedirect("booktrack")
        }
        route("booktrack") {
            get {
                // Show a list of books
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

                print(dao.allBookComments(id))
                call.respond(FreeMarkerContent("show.ftl", mapOf("book" to dao.book(id),
                    "comments" to dao.allBookComments(id))))
            }
            get("{id}/edit") {
                // Show a page with fields for editing a book
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("edit.ftl", mapOf("book" to dao.book(id))))
            }

            get("{id}/{commentId}") {
                // Show a page with fields for editing a comment
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val commentId = call.parameters.getOrFail<Int>("commentId").toInt()
                call.respond(FreeMarkerContent("editComment.ftl", mapOf("book" to dao.book(id), "comment" to dao.comment(commentId))))
            }

            post("{id}/{commentId}") {
                // Update a comment
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val commentId = call.parameters.getOrFail<Int>("commentId").toInt()
                val formParameters = call.receiveParameters()
                when (formParameters.getOrFail("_action")) {
                    "update" -> {
                        val content = formParameters.getOrFail("content")
                        dao.editComment(commentId, content)
                        call.respondRedirect("/booktrack/$id")
                    }
                    "delete" -> {
                        dao.deleteComment(commentId)
                        call.respondRedirect("/booktrack/$id")
                    }
                }
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
                        dao.deleteAllBookComments(id)
                        call.respondRedirect("/")
                    }
                    "comment" -> {
                        val content = formParameters.getOrFail("content")
                        dao.addNewComment(id, content)
                        call.respondRedirect("/booktrack/$id")
                    }
                }
            }
        }
    }
}
