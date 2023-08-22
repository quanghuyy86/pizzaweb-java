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
public class ComboController extends BaseController{
	@RequestMapping(value = {"/combo"}, method = RequestMethod.GET)
	public String Combo(final Model model,
						final HttpServletRequest request,
						final HttpServletResponse response)throws IOException{
		return "customer/home_combo";
	}

}
