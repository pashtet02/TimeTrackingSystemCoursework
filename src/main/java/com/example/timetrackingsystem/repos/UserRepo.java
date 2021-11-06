package com.example.timetrackingsystem.repos;

import com.example.timetrackingsystem.model.User;
import com.example.timetrackingsystem.model.role.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

/*    @Query(value = "select u.id, u.active, u.password, u.first_name, u.second_name, u.username " +
            "from user as u inner join user_role as ur where u.id = ur.user_id and ur.roles = ?1")*/
    List<User> findByRoles(Role role);

    @Query(value = "SELECT u.* FROM user u WHERE u.company_id = ?1", nativeQuery = true)
    List<User> findByCompanyId(long companyId);

    User findByActivationCode(String code);
}
