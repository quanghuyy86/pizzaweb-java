package com.devpro.javaweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//Anotation
//--> Nhận biết đây là ứng dụng Spring-Boot
@SpringBootApplication
public class StartSever {
	public static void main(String[] args) {
		//Chạy 1 ứng dụng Spring-Boot với class StartSever
		SpringApplication.run(StartSever.class, args);
	} 
}
	