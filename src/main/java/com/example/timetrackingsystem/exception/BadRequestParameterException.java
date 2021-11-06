package com.example.timetrackingsystem.exception;

public class BadRequestParameterException extends RuntimeException {
    public BadRequestParameterException() {
        super();
    }

    public BadRequestParameterException(String message) {
        super(message);
    }

    public BadRequestParameterException(String message, Throwable cause) {
        super(message, cause);
    }
}
