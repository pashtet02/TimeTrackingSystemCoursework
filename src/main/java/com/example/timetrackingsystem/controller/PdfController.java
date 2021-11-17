package com.example.timetrackingsystem.controller;

import com.example.timetrackingsystem.TimeTrackingSystemApplication;
import com.example.timetrackingsystem.model.TimeReport;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.service.ReportService;
import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Configuration
@RequestMapping("/download")
@Slf4j
public class PdfController {
    @Value("${my.hostname}")
    private String hostname;

    private final ReportService reportService;

    public PdfController(ReportService reportService) {
        this.reportService = reportService;
    }

    @GetMapping("{employeeId}")
    public ResponseEntity<byte[]> downloadPdf(
            @PathVariable Long employeeId,
            @AuthenticationPrincipal User user,
            Model model) throws IOException, TemplateException {
        Page<TimeReport> page = reportService.getUserTimeReports(employeeId, Pageable.ofSize(3));

        model.addAttribute("page", page);
        model.addAttribute("user", user);
        model.addAttribute("addReport", false);
        model.addAttribute("downloadReport", false);


        freemarker.template.Configuration cfg = new freemarker.template.Configuration(freemarker.template.Configuration.VERSION_2_3_31);
        cfg.setClassForTemplateLoading(TimeTrackingSystemApplication.class, "/templates");
        cfg.setIncompatibleImprovements(new Version(2, 3, 31));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setLocale(Locale.US);
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

        Map<String, Object> input = new HashMap<>();
        input.put("page", page);
        input.put("user", user);
        input.put("addReport", false);
        input.put("downloadReport", false);

        Template template = cfg.getTemplate("mainToDownload.ftlh");
        File file = new File("report.pdf");
        Writer fileWriter = new FileWriter(file);
        System.out.println(template);
        template.process(input, fileWriter);

        String content = FileUtils.readFileToString(file, StandardCharsets.UTF_8);
        ByteArrayOutputStream target = new ByteArrayOutputStream();

        ConverterProperties converterProperties = new ConverterProperties();
        converterProperties.setBaseUri("http://" + hostname);

        HtmlConverter.convertToPdf(content, target, converterProperties);
        byte[] bytes = target.toByteArray();

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .body(bytes);
    }
}
