package com.example.timetrackingsystem.repos;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.timetrackingsystem.model.TimeReport;

import java.util.List;

public interface TimeReportRepo extends JpaRepository<TimeReport, Long> {
    List<TimeReport> findByHours(Integer hours);

    List<TimeReport> findByAuthorId(long userId);

    Page<TimeReport> findByAuthorId(long userId, Pageable pageable);
}
