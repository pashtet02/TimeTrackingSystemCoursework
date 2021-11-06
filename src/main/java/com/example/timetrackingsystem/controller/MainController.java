package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.model.TimeReport;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.service.ReportService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@Slf4j
@AllArgsConstructor
public class MainController {
    private final ReportService reportService;

    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@AuthenticationPrincipal User user,
            @RequestParam(required = false, name = "filterHours") String filterHours,
                       Model model) {
        Iterable<TimeReport> reports;

        if (filterHours != null){
            reports = reportService.findByHours(Integer.valueOf(filterHours));
        } else {
            reports = reportService.getAllTimeReports();
        }
        model.addAttribute("user", user);
        model.addAttribute("reports", reports);
        model.addAttribute("filterHours", filterHours);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "createdAt")
                          @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime createdAt,
                      @RequestParam Integer hours, Model model) {
        reportService.save(createdAt, hours, user);

        List<TimeReport> reports = reportService.getAllTimeReports();

        model.addAttribute("reports", reports);

        return "main";
    }
}
