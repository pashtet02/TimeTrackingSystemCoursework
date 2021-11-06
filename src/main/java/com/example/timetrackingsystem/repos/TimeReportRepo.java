package com.example.timetrackingsystem.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.timetrackingsystem.model.TimeReport;

import java.util.List;

public interface TimeReportRepo extends JpaRepository<TimeReport, Long> {
    List<TimeReport> findByHours(Integer hours);
}
