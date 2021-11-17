package com.example.timetrackingsystem.model;

import com.example.timetrackingsystem.model.role.ReportType;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class TimeReport implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    private Date createdAt;

    private Integer hours;

    private boolean isOvertime;

    @CollectionTable(name = "time_report_type",
            joinColumns = @JoinColumn(name = "report_id"))
    @Enumerated(EnumType.STRING)
    private ReportType reportType;

    private String description;
}
