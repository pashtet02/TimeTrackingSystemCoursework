package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.model.TimeReport;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.model.role.ReportType;
import com.example.timetrackingsystem.service.ReportService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.Instant;
import java.time.temporal.TemporalField;
import java.util.Calendar;

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

        if (filterHours != null) {
            reports = reportService.findByHours(Integer.valueOf(filterHours));
        } else {
            reports = reportService.getUserTimeReports(user.getId());
        }
        model.addAttribute("user", user);
        model.addAttribute("reports", reports);
        model.addAttribute("filterHours", filterHours);
        model.addAttribute("addReport", true);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam Integer hours,
            @RequestParam(name = "description") String description,
            @RequestParam(name = "isOvertime", required = false) Boolean isOvertime,
            @RequestParam(name = "reportType") String type) {
        Date createdAt = new Date(Calendar.getInstance().getTime().getTime());

        ReportType reportType;

        switch (type) {
            case "vacation":
                reportType = ReportType.VACATION;
                break;
            case "sickLeave":
                reportType = ReportType.SICK_LEAVE;
                break;
            case "work":
                reportType = ReportType.WORK;
                break;
            default:
                reportType = ReportType.OTHER;
        }

        TimeReport report = TimeReport.builder()
                .reportType(reportType)
                .createdAt(createdAt)
                .author(user)
                .hours(hours)
                .description(description)
                .isOvertime(isOvertime)
                .build();
        reportService.save(report);
        return "redirect:/main";
    }
}
