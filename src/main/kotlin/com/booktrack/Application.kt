package com.booktrack

import com.booktrack.plugins.*
import io.ktor.server.application.*
import io.ktor.server.plugins.cors.routing.*

fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

fun Application.module() {
    install(CORS) {
        anyHost()
    }
    configureSerialization()
    configureTemplating()
    configureRouting()
}
