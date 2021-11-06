package com.example.timetrackingsystem.service;

import com.example.timetrackingsystem.model.TimeReport;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.repos.TimeReportRepo;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@AllArgsConstructor
@Slf4j
public class ReportService {

    private final TimeReportRepo timeReportRepo;

    public List<TimeReport> getAllTimeReports(){
        return timeReportRepo.findAll();
    }

    public void save(LocalDateTime createdAt, Integer hours, User user) {
        TimeReport report = new TimeReport();
        report.setHours(hours);
        report.setCreatedAt(createdAt);
        report.setOvertime(false);
        report.setAuthor(user);

        timeReportRepo.save(report);
    }

    public List<TimeReport> findByHours(Integer hours){
        if (hours < 0 || hours > 24){
            throw new RuntimeException("Hours cannot be less than 0 or more than 24");
        }
        return timeReportRepo.findByHours(hours);
    }
}