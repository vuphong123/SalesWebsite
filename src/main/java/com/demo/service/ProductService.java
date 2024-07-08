package com.demo.service;


import com.demo.model.Product;
import com.demo.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductRepo productRepo;

    public List<Product> getAll(Sort sort){
        return productRepo.findAll(sort);
    }

    public Product findById(Integer id) {
        return productRepo.findById(id).orElse(null);
    }
    public Product add(Product product){
        return productRepo.save(product);
    }
    public Page<Product> findAndSearch(String keyword, Integer price1, Integer price2, String categoryId, Pageable pageable) {
        Page<Product> page = productRepo.Search(keyword ,price1, price2, categoryId, pageable);
        return page;
    }
    public void delete(Integer id){
        productRepo.deleteById(id);
    }
    public Page<Product> findAndSearchAdmin(String keyword, String categoryId, Pageable pageable) {
        Page<Product> page = productRepo.SearchAdmin(keyword, categoryId, pageable);
        return page;
    }
}
