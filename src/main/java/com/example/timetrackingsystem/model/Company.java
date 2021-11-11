package com.example.timetrackingsystem.model;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private String image;
    private String country;
    private String address;
    private String email;
    private String webSite;

    @OneToOne
    @JoinColumn(name = "director_id")
    private User director;

    @OneToMany
    private List<User> employees;

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
}
