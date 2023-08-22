package com.devpro.javaweb.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "tbl_roles")
public class Role extends BaseEntity implements GrantedAuthority{
	
	@Column(name = "name", length = 45, nullable = false)
	private String name;
	
	@Column(name = "description",length = 45, nullable = false)
	private String description; 
	
	//nhiều role có nhiều user
	@ManyToMany(cascade = CascadeType.ALL,
				fetch = FetchType.EAGER,
				mappedBy = "roles") // tên property bên phía user
	private Set<User> users = new HashSet<User>();
	
	public void addUser(User user) { 
		users.add(user);
		user.getRoles().add(this);
	}
	
	public void deleteUser(User User) {
		users.remove(User);
		User.getRoles().remove(this);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.name;
	}

	
	
	
}
