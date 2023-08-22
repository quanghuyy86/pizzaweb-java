package com.devpro.javaweb.model;

public class Employee {
	
	private Integer maNv; //property phải có 2 method GET và SET
	private String tenNv; //property phải có 2 method GET và SET
	
	public Employee(Integer maNv, String tenNv) {
		super();
		this.maNv = maNv;
		this.tenNv = tenNv;
	}

	public Integer getMaNv() {
		return maNv;
	}

	public void setMaNv(Integer maNv) {
		this.maNv = maNv;
	}

	public String getTenNv() {
		return tenNv;
	}

	public void setTenNv(String tenNv) {
		this.tenNv = tenNv;
	}
	
	
}
