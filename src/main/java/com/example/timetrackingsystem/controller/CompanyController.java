package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.exception.CompanyNotFoundException;
import com.example.timetrackingsystem.model.Company;
import com.example.timetrackingsystem.model.TimeReport;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.service.CompanyService;
import com.example.timetrackingsystem.service.ReportService;
import com.example.timetrackingsystem.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@Slf4j
@RequestMapping("/company")
public class CompanyController {
    @Value("${upload.path}")
    private String uploadPath;

    private final CompanyService companyService;
    private final UserService userService;
    private final ReportService reportService;

    public CompanyController(CompanyService companyService, UserService userService, ReportService reportService) {
        this.companyService = companyService;
        this.userService = userService;
        this.reportService = reportService;
    }

    @GetMapping
    public String companyInfo(
            @AuthenticationPrincipal User user,
            Model model){
        Company company = null;
        if (user.getCompany() != null){
            company = user.getCompany();
        } else {
            company = companyService.getByDirectorId(user.getId());
        }
        log.info("companyInfo: user.getCompany(): " + user.getCompany());
        model.addAttribute("company", company);
        return "companyInfo";
    }

    @GetMapping("/employees")
    public String companyEmployees(@RequestParam long companyId, Model model){

        Company returnCompany = companyService.findById(companyId)
                .orElseThrow(CompanyNotFoundException::new);

        List<User> employees = userService.getAllEmployeesByCompany(companyId);
        model.addAttribute("employees", employees);
        log.info("Company employees company.employees(): {}", returnCompany.getEmployees());
        model.addAttribute("company", returnCompany);
        return "companyEmployeesList";
    }

    @GetMapping("/create")
    @PreAuthorize("hasAuthority('EMPLOYER')")
    public String createCompany(@AuthenticationPrincipal User user){
        if (user.getCompany() == null){
            return "companyCreate";
        }
        return "companyInfo";
    }

    @GetMapping("/statistics/{employee}")
    @PreAuthorize("hasAuthority('EMPLOYER')")
    public String getEmployeeStatistics(@PathVariable User employee, Model model){
        Iterable<TimeReport> reports;
        reports = reportService.getUserTimeReports(employee.getId());

        model.addAttribute("user", employee);
        model.addAttribute("reports", reports);
        model.addAttribute("addReport", false);
        model.addAttribute("downloadReport", true);
        return "main";
    }

    @PostMapping()
    @PreAuthorize("hasAuthority('EMPLOYER')")
    public String createCompany(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "companyName") String companyName,
            @RequestParam(name = "companyCountry") String companyCountry,
            @RequestParam(name = "companyEmail", required = false) String companyEmail,
            @RequestParam(name = "companyAddress", required = false) String companyAddress,
            @RequestParam(name = "companyWebSite", required = false) String companyWebSite,Model model,
            @RequestParam(value = "image", required = false) MultipartFile file
    ) throws IOException {
        Company company = new Company();
        company.setCountry(companyCountry);
        company.setDirector(user);
        company.setName(companyName);
        company.setEmail(companyEmail);
        company.setAddress(companyAddress);
        company.setWebSite(companyWebSite);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            company.setImage(resultFilename);
        }


        Optional<Company> companyOptional = companyService.findByName(company.getName());
        if (companyOptional.isPresent())
            throw new RuntimeException("Such company already exists");

        companyService.save(company);

        Company returnCompany = companyService.findByName(companyName)
                .orElseThrow(CompanyNotFoundException::new);

        user.setCompany(company);
        User director = userService.save(user);

        model.addAttribute("company", returnCompany);
        model.addAttribute("director", director);
        log.info("created company: {}. Director: {}", company, user);
        return "companyInfo";
    }
}
