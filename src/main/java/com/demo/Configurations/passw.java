package com.demo.Configurations;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class passw {
    public static void main(String[] args) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        passwordEncoder.encode("password123");
        System.out.println(passwordEncoder.encode("password123"));
    }

}
