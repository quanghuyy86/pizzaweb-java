package com.devpro.javaweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


//object mapping cho spring form

@Entity //Báo cho Spring JPA biết. cụ thể là EntiTy Manager
@Table(name = "tbl_contact") // Entity được mapping đến Table có tên là "tbl_contact"
public class Contact extends BaseEntity{
	@Column(name = "first_name", length = 45, nullable = false)
	private String firstName;
	
	@Column(name = "last_name", length = 45, nullable = false)
	private String lastName;

	@Column(name = "email", length = 45, nullable = true)
	private String email;
	
	@Column(name = "message", length = 1000, nullable = false)
	private String message;


	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
	
}
