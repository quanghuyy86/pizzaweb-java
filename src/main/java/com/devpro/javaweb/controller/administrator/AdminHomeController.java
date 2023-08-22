package com.devpro.javaweb.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminHomeController {
	@RequestMapping(value = {"/admin/home"}, method = RequestMethod.GET)
	public String home(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response) throws IOException {
		return "administrator/adminhome";

	}
}
