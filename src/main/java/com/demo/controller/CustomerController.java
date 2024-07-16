package com.demo.controller;

import com.demo.model.Account;
import com.demo.model.Order;
import com.demo.model.OrderDetail;
import com.demo.model.Product;
import com.demo.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class CustomerController {
	@Autowired
	private HttpSession session;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private OrderService orderService;
	private String uri = null;
	@ModelAttribute("cart")
	private CartService getCartService(){
		return cartService;
	}
	@Data @AllArgsConstructor
	public static class PriceRange{
		int id;
		int minValue;
		int maxValue;
		String display;
	}

	List<PriceRange> priceRangeList = Arrays.asList(
		new PriceRange(0,0, Integer.MAX_VALUE, "Tất cả"),
		new PriceRange(1,0, 10000000, "Dưới 10 triệu"),
		new PriceRange(2,10000000, 20000000, "Từ 10-20 triệu"),
		new PriceRange(3,20000000, Integer.MAX_VALUE, "Trên 20 triệu")
	);

	@GetMapping("/")
	public String index(
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="%") String categoryId,
			@RequestParam(defaultValue="0") int priceRangeId,
			@RequestParam(defaultValue="0") int page,
			Model model) {
		System.out.println("/// " + session.getAttribute("account"));
		model.addAttribute("priceRangeList", priceRangeList);
		model.addAttribute("categoryList", categoryService.getAll());
		Pageable pageable = PageRequest.of(page, 5);

		int minPrice = priceRangeList.get(priceRangeId).minValue;
		int maxPrice = priceRangeList.get(priceRangeId).maxValue;

		model.addAttribute("productList", productService.findAndSearch("%"+keyword+"%", minPrice, maxPrice,categoryId, pageable));
		System.out.println("keyword=" + "%"+keyword+"%");
		System.out.println("categoryId=" + categoryId);
		System.out.println("minPrice=" + minPrice);
		System.out.println("maxPrice=" + maxPrice);
		System.out.println("page=" + page);

		// TODO: Search & paginate
		//paginate

		return "customer/index";
	}

	@GetMapping("/detail/{id}")
	public String viewProduct(@PathVariable int id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		return "customer/detail";
	}

	@RequestMapping("/add-to-cart/{id}")
	public String addToCart(@PathVariable int id){
		if(session.getAttribute("account") == null){
			System.out.println("/add-to-cart/{id} " + session.getAttribute("username"));
			return  "redirect:/login";
		}
		cartService.add(id);
		return "redirect:/cart";
	}

	@RequestMapping("/remove-cart/{id}")
	public String removeCart(@PathVariable int id) {
		cartService.remove(id);
		if(cartService.getTotal() == 0){
			return "redirect:/";
		}
		return "redirect:/cart";
	}

	@RequestMapping("/update-cart/{id}")
	public String updateCart(@PathVariable int id, int quantity) {
		cartService.update(id, quantity);
		return "redirect:/cart";
	}

	@GetMapping("/cart")
	public String cart(){
		if(session.getAttribute("account") == null){
			System.out.println("/add-to-cart/{id} " + session.getAttribute("username"));
			return  "redirect:/login";
		}
		return "customer/cart";
	}

	@GetMapping("/checkout")
	public String confirm(){
		if(session.getAttribute("account") == null){
			return  "redirect:/login";
		}
		return "customer/checkout";
	}

	@RequestMapping("/about")
	public String about(Model model) {
		return "customer/about";
	}

	@GetMapping("/login")
	public String login(){
		return "login";
	}

	@PostMapping("/loginPost")
	public String login(@RequestParam String username, @RequestParam String password, Model model) {
		for(Account ac : loginService.getAllAccount()){
			if(ac.getUsername().equals(username) && ac.getPassword().equals(password)) {
				Account acc = new Account();
				acc.setUsername(username);
				session.setAttribute("account", acc);
				if(uri != null){
					return uri;
				}else{
					return "redirect:/";
				}
			}
		}
		model.addAttribute("message", "Tên đăng nhập/mật khẩu không đúng");
		return "login";
	}

	@PostMapping("/purchase")
	public String purchase(@RequestParam String address, Model model){
		System.out.println("address=" + address);
		System.out.println("items=" + cartService.getItems());
		Account acc = (Account) session.getAttribute("account");
		if(acc != null) {
			Order order = new Order();
			order.setAccount(acc);
			order.setAddress(address);
			order.setCreatedate(new Date());
			if(orderService.addOrder(order) !=null){
				for(OrderDetail item : cartService.getItems()){
					item.setOrder(order);
					orderService.addOrderDetail(item);
					model.addAttribute("check",true);
					// TODO: Save order detail
				}
			}
			// TODO :clear cart
		}
		cartService.clear();
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(){
		session.invalidate();
//		session.removeAttribute("username");
		return "redirect:/login";
	}
//	@GetMapping("/search")
//	public String search(@RequestParam(defaultValue = "") String keyword, @RequestParam String categoryId, @RequestParam Integer priceRangeId){
//		session.removeAttribute("username");
//		return "redirect:/login";
//	}
}
