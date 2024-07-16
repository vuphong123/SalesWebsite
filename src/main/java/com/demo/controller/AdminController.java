package com.demo.controller;

import com.demo.model.Account;
import com.demo.model.Category;
import com.demo.model.Product;
import com.demo.repo.ProductRepo;
import com.demo.service.AccountService;
import com.demo.service.CategoryService;
import com.demo.service.ProductService;
import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AccountService accountService;
    @ModelAttribute("listCategory")
    public List<Category> getList(){
        return categoryService.getAll();
    }
    @GetMapping("/admin/main")
    public String Main(Model model){
        return "admin/index";
    }
    //  Category
    @GetMapping("/admin/category")
    public String listCategory(Model model){
        model.addAttribute("listCate", categoryService.getAll());
        return "admin/category/list";
    }

    @GetMapping("/admin/category/create")
    public String createCategory(Model model){
        model.addAttribute("category", new Category());
        return "admin/category/form";
    }
    @PostMapping("/admin/category/create/save")
    public String createCategory(@Valid @ModelAttribute("category") Category category, BindingResult bindingResult){
        if(!bindingResult.hasErrors()){
            categoryService.addAndUpdate(category);
            return "redirect:/admin";
        }
        return "admin/category/form";
    }
    @GetMapping("/admin/category/delete/{id}")
    public String createCategory(@PathVariable String id){
        categoryService.delete(id);
        return  "redirect:/admin";
    }

    @GetMapping("/admin/category/update/{id}")
    public String editCategory(@PathVariable String id, Model model){
        model.addAttribute("category",categoryService.findById(id));
        return "admin/category/form";
    }
    @PostMapping("/admin/category/update/save/{id}")
    public String editCategorySave(@PathVariable String id, @Valid @ModelAttribute("category") Category category, BindingResult bindingResult){
        if(!bindingResult.hasErrors()){
            category.setId(id);
            categoryService.addAndUpdate(category);
            return  "redirect:/admin";
        }
        return "admin/category/form";
    }

    //  Product
    @GetMapping("/admin/product")
    public String listProduct(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "%") String categoryId, Model model){
        Pageable pageable = PageRequest.of(page, 5);
        Page<Product> p = productService.findAndSearchAdmin("%"+keyword+"%", categoryId,pageable);
        System.out.println("số Luong " + p);
        model.addAttribute("listProduct", p);
        return "admin/product/list";
    }

    @GetMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("product")Product product){
        return "admin/product/form";
    }
    @PostMapping("/admin/product/create/save")
    public String createProductSave(@Valid @ModelAttribute("product")Product product, BindingResult bindingResult, @RequestParam("anh")MultipartFile anh) throws IOException {
        if(!bindingResult.hasErrors()){
            if(!anh.isEmpty()){
                ClassLoader classLoader = getClass().getClassLoader();
                String filename = anh.getOriginalFilename();
                String saveTo = classLoader.getResource("static/images").getFile();
                File file = new File(saveTo+"/"+filename);
                product.setImage("/static/images/"+filename);
                if(!file.exists()){
                    anh.transferTo(file);
                }
            }
            product.setCreatedate(new Date());
            if(productService.add(product) !=null){
                return "redirect:/admin/product";
            }
        }
        return "admin/product/form";
    }

    @GetMapping("/admin/product/update/{id}")
    public String editProduct(@PathVariable Integer id, Model model){
        Product productDetail = productService.findById(id);
        model.addAttribute("product", productDetail);
        return "admin/product/form";
    }
    @PostMapping("/admin/product/update/save/{id}")
    public String editProductSave(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult, @RequestParam("anh")MultipartFile anh, @PathVariable Integer id) throws IOException {
        if(!bindingResult.hasErrors()){
            if(!anh.isEmpty()){
                ClassLoader classLoader = getClass().getClassLoader();
                String filename = anh.getOriginalFilename();
                String saveTo = classLoader.getResource("static/images").getFile();
                File file = new File(saveTo+"/"+filename);
                product.setImage("/static/images/"+filename);
                if(!file.exists()){
                    anh.transferTo(file);
                }
            }
            product.setId(id);
            product.setCreatedate(new Date());
            if(productService.add(product) !=null){
                return "redirect:/admin/product";
            }
        }
        return "admin/product/form";
    }
    @GetMapping("/admin/product/delete/{id}")
    public String deleteProduct(@PathVariable Integer id, Model model){
        productService.delete(id);
        return "redirect:/admin/product";
    }

    //  Account
    @GetMapping("/admin/account")
    public String listAccount(Model model){
        model.addAttribute("listAccount", accountService.getAll());
        return "admin/account/list";
    }

    @GetMapping("/admin/account/create")
    public String createAccount(@ModelAttribute("account")Account account){
        return "admin/account/form";
    }
    @PostMapping("/admin/account/create/save")
    public String createAccountSave(@Valid @ModelAttribute("account")Account account, BindingResult bindingResult){
        if(!bindingResult.hasErrors()){
            accountService.add(account);
            return "redirect:/admin/account";
        }
        return "admin/account/form";
    }

    @GetMapping("/admin/account/update/{id}")
    public String editAccount(@PathVariable String id, Model model){
        model.addAttribute("account", accountService.findByUser(id));
        return "admin/account/formUpdate";
    }
    @PostMapping("/admin/account/update/save/{id}")
    public String editAccountSave(@PathVariable String id, @Valid @ModelAttribute("account") Account account, BindingResult bindingResult){
        if(!bindingResult.hasErrors()){
            account.setUsername(id);
            accountService.add(account);
            return "redirect:/admin/account";
        }
        return "admin/account/formUpdate";
    }
    @GetMapping("/admin/account/delete/{id}")
    public String deleteAccount(@PathVariable String id, Model model){
        accountService.delete(id);
        return "redirect:/admin/account";
    }
}
