package com.devpro.javaweb.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_users")
public class User extends BaseEntity implements UserDetails{
	
	@Column(name = "username", length = 45, nullable = false)
	private String username;
	
	@Column(name = "password", length = 45, nullable = false)
	private String password;
	
	@Column(name = "email", length = 45, nullable = false)
	private String email;
	
	@Column(name = "phone", length = 100, nullable = true)
	private String phone;
	
	@Column(name = "shipping_address", length = 1000, nullable = false)
	private String shippingAddress;
	
	
	//Nhiều user có nhiều roles
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles", //tên bảng trung gian
			   joinColumns = @JoinColumn(name = "user_id"),
			   inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<Role>();
	
	public void addRoles(Role role) { 
		roles.add(role); //role sẽ được thêm trong danh sách roles của user
		role.getUsers().add(this); //User phải được thêm trong danh sách user của role
	}
	
	public void deleteRole(Role role) {
		roles.remove(role);
		role.getUsers().remove(this);
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getShippingAddress() {
		return shippingAddress;
	}


	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}


	public Set<Role> getRoles() {
		return roles;
	}


	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return this.roles;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	

	
	
}
