package com.example.demodaniel;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Rest1 {
    // get method for hello world with @GetMapping
    @GetMapping("/hello")
    public String hello() {
        return "Hello World Daniel !!!! ";
    }

}
