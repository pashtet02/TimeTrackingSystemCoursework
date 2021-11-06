package com.example.timetrackingsystem.repos;

import com.example.timetrackingsystem.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CompanyRepo extends JpaRepository<Company, Long> {
    Optional<Company> findByName(String companyName);

    Company findByDirectorId(Long id);
}
