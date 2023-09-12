package com.hh99.cicd

import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController(
    private val testRepository: TestRepository
) {

    @Value("\${greeting.message}")
    val message: String? = null

    @GetMapping("/hello")
    fun hello(): String {
        return "hello world!!!"
    }

    @GetMapping("/msg")
    fun msg(): String? {
        return message
    }

    @GetMapping("/test")
    fun test(): Test {
        val test = Test(name = "탁지성", address = "서울")
        return testRepository.save(test)
    }

    @GetMapping("/test2")
    fun test2(): Test {
        return testRepository.findById(1).get()
    }
}