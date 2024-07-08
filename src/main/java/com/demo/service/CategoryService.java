package com.demo.service;

import com.demo.model.Category;
import com.demo.repo.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

//TODO: Connect to database

@Service
public class CategoryService {
    @Autowired
    CategoryRepo categoryRepo;
    public List<Category> getAll(){
       return categoryRepo.findAll();
    }
    public Category addAndUpdate(Category category){
        return categoryRepo.save(category);
    }
    public Category findById(String user){
        return categoryRepo.findById(user).orElse(null);
    }
    public void delete(String id){
       categoryRepo.deleteById(id);
    }
}
