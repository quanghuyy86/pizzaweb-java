package com.devpro.javaweb.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb.controller.BaseController;



@Controller
public class RegisterController extends BaseController{
	@RequestMapping(value = {"/register"}, method = RequestMethod.GET)
	public String Register(final Model model,
						   final HttpServletRequest request,
						   final HttpServletResponse response) throws IOException {
		
		model.addAttribute("registerModel", new com.devpro.javaweb.model.Register());
		return "customer/register";
	}
	
	
	/*
	 * Để hứng dữ liệu khi click submit buttom trong một spring form
	 * Thì cần sử dụng @modelAttribute và giá trị phải giống với html attribute modelAttribute
	*/
	@RequestMapping(value = {"/register-spring-form"}, method = RequestMethod.POST)
	public String register_post_springForm(final Model model,
										  final HttpServletRequest request,
										  final HttpServletResponse response,
										  final @ModelAttribute("registerModel") com.devpro.javaweb.model.Register register) throws IOException {
		System.out.println("Name: " + register.getFullName());
		System.out.println("Email: " + register.getEmail());
		System.out.println("Mat khau: " + register.getPassword());
		System.out.println("Mat khau xac nhan: " + register.getConfirmPassword());
		
		model.addAttribute("registerModel", new com.devpro.javaweb.model.Register());
		
		return "customer/register";
		
	}
}


