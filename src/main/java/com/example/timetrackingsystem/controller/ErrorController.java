package com.example.timetrackingsystem.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Configuration
@RequestMapping("/error")
public class ErrorController {

    @GetMapping
    public String getErrorPage(){
        return "400";
    }
}
