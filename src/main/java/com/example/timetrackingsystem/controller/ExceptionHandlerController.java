package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.exception.BadRequestParameterException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@Slf4j
@ControllerAdvice
public class ExceptionHandlerController {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleException(Exception ex) {
        log.error("handleException: message {}", ex.getMessage());
        return "400";
    }

    @ExceptionHandler(BadRequestParameterException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleBadRequestParameterException(BadRequestParameterException ex, Model model) {
        log.error("handleBadRequestParameterException: message {}", ex.getMessage());
        model.addAttribute("error", ex.getMessage());
        return "400";
    }
}
