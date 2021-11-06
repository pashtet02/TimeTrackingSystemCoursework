package com.example.timetrackingsystem.service;

import com.example.timetrackingsystem.model.Company;
import com.example.timetrackingsystem.repos.CompanyRepo;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

@AllArgsConstructor
@Slf4j
@Service
public class CompanyService {
    private final CompanyRepo companyRepo;

    public void save(Company company){
        companyRepo.save(company);
    }

    public Optional<Company> findById(long companyId){
        return companyRepo.findById(companyId);
    }

    public Optional<Company> findByName(String companyName){
        return companyRepo.findByName(companyName);
    }

    public Company getByDirectorId(Long id) {
       return companyRepo.findByDirectorId(id);
    }
}
