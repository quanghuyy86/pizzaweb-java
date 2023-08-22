package com.devpro.javaweb.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb.controller.BaseController;
import com.devpro.javaweb.model.Product;
import com.devpro.javaweb.services.ProductService;

@Controller
public class SaladController extends BaseController{
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = {"/salad"}, method = RequestMethod.GET)
	public String Salad(final Model model,
						final HttpServletRequest request,
						final HttpServletResponse response) throws IOException{
		
		List<Product> products = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products where category_id=47");
		model.addAttribute("products", products);
		return "customer/home_salad";
	}

}
