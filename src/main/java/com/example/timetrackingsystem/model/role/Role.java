package com.example.timetrackingsystem.model.role;

import org.springframework.security.core.GrantedAuthority;

import java.io.Serializable;

public enum Role implements GrantedAuthority {
    EMPLOYER, EMPLOYEE, ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
