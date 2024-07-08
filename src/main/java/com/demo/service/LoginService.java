package com.demo.service;

import com.demo.model.Account;
import com.demo.repo.AccountRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginService {
    @Autowired
    AccountRepo accountRepo;
    public List<Account> getAllAccount(){
        return accountRepo.findAll();
    }
}
