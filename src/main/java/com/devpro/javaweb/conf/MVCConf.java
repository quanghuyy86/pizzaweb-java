package com.devpro.javaweb.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/*
 * Bước 2: sau khi tích hợp một spring module vào Spring-Boot project sau đó là CẤU HÌNH module đó
 * 1. Báo cho Spring biết là đây là 1 file cấu hình
 * 2. Tạo ra một Bean và được quản lí bới Spring-Container*/
@Configuration
public class MVCConf implements WebMvcConfigurer{
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		
		//ERROR: http://localhost:8080/css/styles.css 404
		//bất cứ request nào có dạng: http://localhost:8080/css/thumuccon/dcf.css sẽ vào folder src/main/resources/css
		//classpath: = /src/main/resources
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		
		//ERROR: http://localhost:8080/js/scripts.js 404
		//bất cứ request nào có dạng: http://localhost:8080/js/thumuccon/dcf.js sẽ vào folder src/main/resources/js
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");		
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		
		//đăng kí thêm folder upload
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");		
	}
	
	@Bean
	public ViewResolver viewResolver() {
		// Class InternalResourceViewResolver implements ViewResolver
				InternalResourceViewResolver bean = new InternalResourceViewResolver();

				// thiết lập view engine
				bean.setViewClass(JstlView.class);

				// Đường dẫn thư mực gốc chứa Views.
				bean.setPrefix("/WEB-INF/views/");

				// Tên đuôi của View
				bean.setSuffix(".jsp");
				
				return bean;
	}
	
}
