package com.demo.repo;

import com.demo.model.Category;
import com.demo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepo extends JpaRepository<Product, Integer> {
    @Query("select sp from Product sp where " +
            "sp.name like :keyword " +
            "and sp.price Between :priceMin and :priceMax " +
            "and sp.category.id like :category")
    Page<Product> Search(@Param("keyword") String keyword, @Param("priceMin") Integer priceMin, @Param("priceMax") Integer priceMax, @Param("category") String id, Pageable pageable);

    @Query("select sp from Product sp where " +
            "sp.name like :keyword " +
            "and sp.category.id like :category")
    Page<Product> SearchAdmin(@Param("keyword") String keyword, @Param("category") String id, Pageable pageable);
}
