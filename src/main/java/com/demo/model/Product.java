package com.demo.model;

import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@Table(name="Products")
public class Product implements Serializable {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotBlank(message = "Name invalid")
    private String name;
    @DecimalMin(value = "0", message = "Price must be a number")
    @NotNull(message = "Price invalid")
    private Integer price;
    private Date createdate;
    @ManyToOne @JoinColumn(name="Categoryid")
    private Category category;
    private String image;
}
