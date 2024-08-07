/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Accelution.ims.service;

import Accelution.ims.model.User;
import Accelution.ims.repo.UserRepo;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nevanjith
 */
@Service
public class LoginService {

    @Autowired
    UserRepo repo;

    @Autowired
    JdbcTemplate temp;

    public User checkLogin(String username, String password) {

        User user = repo.findByUsername(username).orElse(null);

        if (user != null && user.getPassword().equals(password)) {
            return user;
        } else {
            return null;
        }
    }

    public User checkUser(String username) {

        User user = repo.findByUsername(username).orElse(null);

        if (user != null && user.getUsername().equals(username)) {
            return user;
        } else {
            return null;
        }
    }

    public void updatePassword(String username, String newPassword) {
        // Retrieve the user from the database
        User user = repo.findByUsername(username).orElse(null);

        if (user != null) {

            user.setPassword(newPassword);

            // Save the updated user to the database
            repo.save(user);
        } else {
            // Handle the case where the user is not found in the database
            // You may throw an exception, log a message, or perform any other appropriate action
        }
    }

    public Map<String, Object> checkLogins(String username) {
        try {
            Map<String, Object> user = temp.queryForMap("select u.id,u.username,e.branch from `hris_new`.user u join `hris_new`.employee e on u.employee_id=e.id where u.`username`=? and e.status='active'", username);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
