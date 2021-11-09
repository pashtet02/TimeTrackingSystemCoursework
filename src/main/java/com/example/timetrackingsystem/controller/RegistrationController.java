package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.exception.BadRequestParameterException;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.model.role.Role;
import com.example.timetrackingsystem.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@AllArgsConstructor
public class RegistrationController {

    private final UserService userService;


    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam(name = "role") String role,
                          User user, Model model) {
        Role userRole;
        log.info("User in register method {}", user);
        switch (role) {
            case "employee":
                userRole = Role.EMPLOYEE;
                break;
            case "employer":
                userRole = Role.EMPLOYER;
                break;
            default:
                throw new BadRequestParameterException("Wrong user Role provided!");
        }

        if (!userService.addUser(user, userRole)) {
            model.addAttribute("message", "User exists!");
            return "registration";
        }
        model.addAttribute("message", "Activation code was sent on your email!");
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }
}
