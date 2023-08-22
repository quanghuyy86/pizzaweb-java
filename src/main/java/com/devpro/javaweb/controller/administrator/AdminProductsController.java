package com.devpro.javaweb.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb.controller.BaseController;
import com.devpro.javaweb.dto.ProductSearch;
import com.devpro.javaweb.model.Product;
import com.devpro.javaweb.services.BaseService;
import com.devpro.javaweb.services.PagerData;
import com.devpro.javaweb.services.ProductService;

@Controller
public class AdminProductsController extends BaseController{
	
	@Autowired 
	private  ProductService productService;
	
		//ex: /admin/product/management/144 (thông tin sản phẩm có id = 144) <=> Path Variable
		//ex: /admin/product/management?productId=144						 <=> request param
		@RequestMapping(value = { "/admin/product/management/{productId}" }, method = RequestMethod.GET)
		public String adminProductDetail(final Model model, 
									   final HttpServletRequest request,
									   final HttpServletResponse response, 
									   @PathVariable("productId") int productId) throws IOException {

			// lấy product trong db theo ProductId
			Product productInDatabase = productService.getById(productId);
			model.addAttribute("product", productInDatabase);
			
			
			return "administrator/product_management";
			
		}
	
	@RequestMapping(value = {"/admin/product/management"}, method = RequestMethod.GET)
	public String adminProductAdd(final Model model,
							 	  final HttpServletRequest request,
							 	  final HttpServletResponse response) throws IOException {
		
		//Khởi tạo 1 product(entity) mới
		Product newProduct = new Product();
		model.addAttribute("product", newProduct);
		
		// Đẩy danh sách categories xuống view(thêm mới sản phẩm) để hiển thị
		// select box cho phép chọn category
//		List<Categories> categories = categoriesService.getEntitiesByNativeSQL("SELECT * FROM tbl_category");
//		model.addAttribute("categories", categories);

		
		return "administrator/product_management";
		
	}
	

	
	
	@RequestMapping(value = {"/admin/product/management"}, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model,
							  			  final HttpServletRequest request,
							  			  final HttpServletResponse response,
							  			  @ModelAttribute("product") Product product,
							  			  @RequestParam("productAvatar") MultipartFile productAvatar,
							  			  @RequestParam("productPictures") MultipartFile[] productPicture) throws IOException {
//		System.out.println("avatar: " + productAvatar.getOriginalFilename());
//		productAvatar.transferTo(new File("C:/upload/" + productAvatar.getOriginalFilename()));
		
		// kiểm tra xem thông tin product đẩy lên khi click submit nên là tạo mới hay chỉnh sửa
				if(product.getId() != null && product.getId() > 0) { //chỉnh sửa sản phẩm
					productService.updateProduct(product, productAvatar, productPicture);
				} else { //thêm mới
					productService.saveProduct(product, productAvatar, productPicture);	
				}
		
		//Lưu sản phẩm mới
//		productService.saveProduct(product, productAvatar, productPicture);
		
		//Trở về trang danh sách sản phẩm
		return "redirect:/admin/product/list";
	}
	
	@RequestMapping(value = {"/admin/product/list"}, method = RequestMethod.GET)
	public String adminProductList(final Model model,
							 	   final HttpServletRequest request,
							 	   final HttpServletResponse response) throws IOException {
		
		//Lấy thông tin từ request param
		String keyword = request.getParameter("keyword");
		Integer categoryId = 0;
		try {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		} catch (Exception e) {
			
		}
		
		 Integer currentPage = BaseService.NO_PAGING;
		 try {
			 currentPage = Integer.parseInt(request.getParameter("page"));
			} catch (Exception e) {
				
			}
		 
		
		//set các giá trị lấy đc vào productSearch dto 
		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyword(keyword);
		productSearch.setCategoryId(categoryId); 
		productSearch.setCurrentPage(currentPage);
		
		PagerData<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("productSearch", productSearch);
		model.addAttribute("products", products);
		
		return "administrator/product_list";
	}
	
	@RequestMapping(value = {"/admin/product/delete"}, method =  RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model,
															 final HttpServletRequest request,
															 final HttpServletResponse response,
															 final @RequestBody Product product) {
		Product productInDb = productService.getById(product.getId());
		productInDb.setStatus(false);
		productService.saveOrUpdate(productInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
}
