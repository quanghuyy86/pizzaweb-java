package com.devpro.javaweb.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb.controller.BaseController;
import com.devpro.javaweb.dto.Cart;
import com.devpro.javaweb.dto.CartItem;
import com.devpro.javaweb.model.Product;
import com.devpro.javaweb.model.SaleOrder;
import com.devpro.javaweb.model.SaleOrderProducts;
import com.devpro.javaweb.services.ProductService;
import com.devpro.javaweb.services.SaleOrderService;

@Controller
public class CartController extends BaseController {
	
	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = {"/cart/checkout"}, method = RequestMethod.GET)
	public String cartCheckout(final Model model,
							   final HttpServletResponse response,
							   final HttpServletRequest request)throws IOException {
		
		return"customer/cart";
	}
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, 
							   final HttpServletRequest request, 
							   final HttpServletResponse response) throws IOException {
		
		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail 	= request.getParameter("customerEmail");
		String customerPhone 	= request.getParameter("customerPhone");
		String customerAddress 	= request.getParameter("customerAddress");

		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);	
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
		
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		
		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);
		
		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		
		return "customer/cart_succsess"; // -> đường dẫn tới View.
		
	}
	
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request 
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sung vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAvatar(productInDb.getAvatar());

			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
			
		}
		
		session.setAttribute("totalPrice", getTotalPrice(request));
		// tính tổng tiền
		//this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", getTotalPrice(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/updateQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model,
														      		   final HttpServletRequest request,
														      		   final HttpServletResponse response, 
														      		   final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request 
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		//kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuanlity = 0;
		for (CartItem item : cartItems) {
			if(item.getProductId() == cartItem.getProductId()) {
				currentProductQuanlity = item.getQuanlity() + cartItem.getQuanlity();
				item.setQuanlity(currentProductQuanlity);
			}
			
		}
		

//		 tính tổng tiền
//		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuanlity", currentProductQuanlity);
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	
	/**
	 * hàm trả về số lượng sản phẩm có trong giỏ hàng
	 * @param request
	 * @return
	 */
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	
	public int getTotalPrice(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity() * item.getPriceUnit().intValue();
		}

		return total;
	}
	
	@RequestMapping(value = { "/cart/product/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> productDelete(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {
		
		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		Iterator<CartItem> iterator = cartItems.iterator();
		while (iterator.hasNext()) {
			CartItem item = iterator.next();
			if(item.getProductId() == cartItem.getProductId()) {
				iterator.remove();
					break;
			}
		}
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		jsonResult.put("totalItem", getTotalItems(request));
		
		
		return ResponseEntity.ok(jsonResult);
	}
	
	
	
	

}

