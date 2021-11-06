package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.model.Company;
import com.example.timetrackingsystem.model.TimeReport;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.model.role.Role;
import com.example.timetrackingsystem.service.CompanyService;
import com.example.timetrackingsystem.service.MailSender;
import com.example.timetrackingsystem.service.ReportService;
import com.example.timetrackingsystem.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
@AllArgsConstructor
@Slf4j
@RequestMapping("/employer")
public class EmployerController {
    private final UserService userService;
    private final MailSender mailSender;
    private final CompanyService companyService;
    private final ReportService reportService;

    @GetMapping("/invite")
    @PreAuthorize("hasAuthority('EMPLOYER')")
    public String employeeList(@AuthenticationPrincipal User user, Model model){
        log.info("user {}", user);
        Company company = companyService.getByDirectorId(user.getId());
        List<User> employees = userService.getAllFreeEmployees(Role.EMPLOYEE);
        model.addAttribute("company", company);
        log.info("company: {}", company);
        model.addAttribute("employees", employees);

        return "employeeList";
    }

    @PostMapping("/inviteEmployee/{employee}")
    public String inviteEmployee(@PathVariable User employee,
                                 @RequestParam(name = "companyName") String companyName){
        employee.setInvitationCode(UUID.randomUUID().toString());
        userService.save(employee);
        if (!StringUtils.isEmpty(employee.getEmail())) {
            String message = String.format(
                    "Dear, %s! \n" +
                            "Please, visit next link: http://localhost:8080/employer/invite/%s?company=%s to accept the invitation to the company: %s",
                    employee.getUsername(),
                    employee.getInvitationCode(),
                    companyName,
                    companyName);

            mailSender.send(employee.getEmail(), "Invitation code", message);
        }

        return "redirect:/company";
    }

    @GetMapping("/invite/{code}")
    public String activate(@AuthenticationPrincipal User user,
                           @PathVariable String code,
                           @RequestParam String company,
                           Model model) {
        userService.inviteUser(code, company);

        List<TimeReport> reports = reportService.getUserTimeReports(user.getId());
        model.addAttribute("reports", reports);

        return "main";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }
}
