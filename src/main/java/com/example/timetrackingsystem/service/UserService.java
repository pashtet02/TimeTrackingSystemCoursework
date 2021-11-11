package com.example.timetrackingsystem.service;

import com.example.timetrackingsystem.exception.CompanyNotFoundException;
import com.example.timetrackingsystem.model.Company;
import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.model.role.Role;
import com.example.timetrackingsystem.repos.UserRepo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
public class UserService implements UserDetailsService {
    @Value("${upload.path}")
    private String uploadPath;

    private final UserRepo userRepo;
    private final PasswordEncoder passwordEncoder;
    private final MailSender mailSender;
    private final CompanyService companyService;

    public UserService(UserRepo userRepo, PasswordEncoder passwordEncoder, MailSender mailSender, CompanyService companyService) {
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
        this.mailSender = mailSender;
        this.companyService = companyService;
    }


    public User save(User user) {
        log.info("User in save method {}", user);
        return userRepo.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (username.isBlank()){
            throw new UsernameNotFoundException("Invalid username provided! Cannot be null, empty or blank!");
        }

        return userRepo.findByUsername(username);
    }

    public List<User> getAllFreeEmployees(Role role) {
        return userRepo.findByRolesAndCompanyIsNull(role);
    }

    public List<User> getAllEmployeesByCompany(long companyId) {
        return userRepo.findByCompanyId(companyId);
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public Optional<User> getUserById(Long id) {
        return userRepo.findById(id);
    }

    public boolean addUser(User user, Role role) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(role));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepo.save(user);

        sendMessage(user);

        return true;
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);
        if (user == null) {
            return false;
        }
        user.setActivationCode(null);
        userRepo.save(user);
        return true;
    }

    public boolean inviteUser(String code, String companyName) {
        User user = userRepo.findByInvitationCode(code);
        Company company = companyService.findByName(companyName).orElseThrow(CompanyNotFoundException::new);
        if (user == null) {
            return false;
        }
        user.setInvitationCode(null);
        user.setCompany(company);
        userRepo.save(user);
        return true;
    }

    public void updateProfile(User user, String password, String email, MultipartFile file) throws IOException {
        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));

        if (isEmailChanged) {
            user.setEmail(email);

            if (!StringUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if (!StringUtils.isEmpty(password)) {
            user.setPassword(passwordEncoder.encode(password));
        }

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            user.setImage(resultFilename);
        }

        userRepo.save(user);

        if (isEmailChanged) {
            sendMessage(user);
        }
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to Timer. Please, visit next link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Activation code", message);
        }
    }
}
