package com.devpro.javaweb.controller.customer;

import java.io.IOException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb.controller.BaseController;
import com.devpro.javaweb.model.Contact;
import com.devpro.javaweb.services.ContactService;


//import com.devpro.javaweb.model.Employee;


@Controller
public class ContactController extends BaseController{
	
	//cách sử dụng 1 spring-bean trong 1 spring-bean khác
	@Autowired //inject spring-bean 
	private ContactService contactService;

	
	@RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
	public String contact(final Model model,
					 	  final HttpServletRequest request,
					 	  final HttpServletResponse response) throws IOException {
		
		String sql = "select * from tbl_contact where status = 1";
		List<Contact> contacts = contactService.getEntitiesByNativeSQL(sql);
		System.out.println("So luong = " + contacts.size());
		
		String sql2 = "select * from tbl_contact where id = 21";
		Contact contact2 = contactService.getEntityByNativeSQL(sql2);
		System.out.println("name = " + contact2.getFirstName() + "" + contact2.getLastName());
		
		
				//Đẩy danh sách nhân viên xuống view
		
//				List<Employee> employees = new ArrayList<Employee>();
//				employees.add(new Employee(1001, "Nguyễn Văn A"));
//				employees.add(new Employee(1002, "Nguyễn Văn B"));
//				employees.add(new Employee(1003, "Nguyễn Văn C"));
//				model.addAttribute("employee", employees);
		 
				// đẩy một data có tên là contactModel xuống view 
				// và có kiểu là Contact => spring-form mới có thể
				// mapping giữa html attribute với class property
				model.addAttribute("contactModel", new Contact());
		
		return "customer/contact";

	}
	
//	@RequestMapping(value = {"/contact"}, method = RequestMethod.POST)
//	public String contactUs(final Model model,
//					 	  final HttpServletRequest request,
//					 	  final HttpServletResponse response) throws IOException {
//		
//		//Lấy dữ liệu từ view đẩy lên thông qua object request
//		String fullName = request.getParameter("fullName");
//		String emali = request.getParameter("email");
//		System.out.println("fullName = " + fullName);
//		System.out.println("email = " + emali);
//		
//		//Đẩy dữ liệu lên View thông qua object model
//		model.addAttribute("message", "Cảm ơn bạn " + fullName + " đã liên hệ");
//		
//		return "customer/contact";
//	}
	
	/*
	 * Để hứng dữ liệu khi click submit buttom trong một spring form
	 * Thì cần sử dụng @modelAttribute và giá trị phải giống với html attribute modelAttribute
	*/
	@RequestMapping(value = {"/contact-spring-form"}, method = RequestMethod.POST)
	public String contact_post_springForm(final Model model,
										  final HttpServletRequest request,
										  final HttpServletResponse response,
										  final @ModelAttribute("contactModel") Contact contact) throws IOException {
		System.out.println("FullName: " + contact.getFirstName() + " " + contact.getLastName());
		System.out.println("Email: " + contact.getEmail());
		System.out.println("Message: " + contact.getMessage());
		
		//final @ModelAttribute("contactModel") Contact contact)
		//Lệnh trên đồng thời đẩy contact xuống view với tên là contactModel
		//nó tương đương câu lệnh: model.addAttribute("contactModel", contact);
		

		//lưu contact vào trong database
		contactService.saveOrUpdate(contact);
		
		model.addAttribute("contactModel", new Contact());
		return "customer/contact";
		
	}
	
	/*
	 * Ajax trả về 1 responsEntity không phải View, Và data của nó là 1 kiểu Map
	 * @RequestBody: để hứng dữ liệu từ ajax đẩy lên
	 * */
//	@RequestMapping(value = {"/contact-ajax"}, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model,
//										  	   				final HttpServletRequest request,
//										  	   				final HttpServletResponse response,
//										  	   				final @RequestBody Contact contact){
//		System.out.println("FullName: " );
//		System.out.println("Email: " );
//		System.out.println("Message: " );
//		
//		//Trả về kết quả
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("StatusCode", 200);
//		jsonResult.put("StatusMessage", "Cảm ơn bạn " + " ,chúng tôi sẽ liên hệ");
//		
//		return ResponseEntity.ok(jsonResult);
//
//	}

	
}
