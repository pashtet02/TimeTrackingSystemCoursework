package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.model.role.Role;
import com.example.timetrackingsystem.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@AllArgsConstructor
@Slf4j
@RequestMapping("/employer")
@PreAuthorize("hasAuthority('EMPLOYER')")
public class EmployerController {
    private final UserService userService;

    @GetMapping("/invite")
    public String employeeList(Model model){

        List<User> employees = userService.getAllUsersByRole(Role.EMPLOYEE);

        model.addAttribute("employees", employees);
        return "employeeList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }
}
