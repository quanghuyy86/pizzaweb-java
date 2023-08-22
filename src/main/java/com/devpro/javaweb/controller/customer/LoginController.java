package com.devpro.javaweb.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb.controller.BaseController;

@Controller
public class LoginController extends BaseController{
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String Login(final Model model,
						final HttpServletRequest request,
						final HttpServletResponse response) throws IOException{
		
		return "customer/login";
	}

}
