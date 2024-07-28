package com.demo.service;

import com.demo.model.Account;
import com.demo.repo.AccountRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccoutService{
    @Autowired
    AccountRepo accountRepo;
    public List<Account> getAll(){
        return accountRepo.findAll();
    }
    public Account findByUser(String user) {
        return accountRepo.findById(user).orElse(null);
    }
    public Account add(Account account){
        return accountRepo.save(account);
    }
    public void delete(String user){
        accountRepo.deleteById(user);
    }

    @Override
    public Account findByUsername(String UserName) {
        return accountRepo.findByUsername(UserName);
    }
}
