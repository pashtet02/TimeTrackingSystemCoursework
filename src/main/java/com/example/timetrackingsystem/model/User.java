package com.example.timetrackingsystem.model;

import com.example.timetrackingsystem.model.role.Role;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class User implements Serializable, UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String username;

    private String position;

    private String email;

    private String profilePhoto;

    private String image;

    private String activationCode;

    private String invitationCode;

    private String password;

    private boolean active;

    private String firstName;

    private String secondName;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "company_id")
    private Company company;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    public boolean isAdmin(){
        if (roles != null){
            return roles.contains(Role.ADMIN);
        }
        return false;
    }

    public boolean isEmployee(){
        if (roles != null){
            return roles.contains(Role.EMPLOYEE);
        }
        return false;
    }

    public boolean isEmployer(){
        if (roles != null){
            return roles.contains(Role.EMPLOYER);
        }
        return false;
    }

    public boolean hasCompany(){
        return company != null;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }
}
