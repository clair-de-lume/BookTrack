package com.booktrack

import com.booktrack.plugins.*
import io.ktor.server.application.*
import io.ktor.server.plugins.cors.routing.*
import com.booktrack.dao.*

fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

fun Application.module() {
    install(CORS) {
        anyHost()
    }
    DatabaseSingleton.init()
    configureSerialization()
    configureTemplating()
    configureRouting()
}
