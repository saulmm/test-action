#!/usr/bin/env kscript
import okhttp3.OkHttpClient
import okhttp3.Request

//DEPS com.squareup.okhttp3:okhttp:3.12.1

private val GITHUB_TOKEN by lazy { System.getenv("GITHUB_TOKEN") }
private val GITHUB_EVENT_PATH by lazy { System.getenv("GITHUB_EVENT_PATH") }

println("Hello from Kotlin! ")
println("Event path: $GITHUB_EVENT_PATH")

//object {
//    fun ghApiRequest() =
//        Request.Builder()
//            .addHeader("Accept: application/vnd.github.v3+json")
//            .addHeader("Authorization: token $GH_TOKEN")
//            .url("https://api.github.com")
//}