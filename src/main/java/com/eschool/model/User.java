package com.eschool.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name="user")
public class User {
	@Column(nullable = false)
    @NotBlank(message = "Email is required")
	@Id
	 String email;
	@Column(nullable = false)
    @NotBlank(message = "Password is required")
	 String password;
	@Column(nullable = false)
    @NotBlank(message = "Name is required")
	 String name;
	@Column(nullable = false)
    @NotBlank(message = "Genser  must be selected")
	 String gender;
	public User(String email, String password, String name ,String gender) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.gender = gender;
	}
	public String getEmail() { 
		return email;
	}
	public String getGender() { 
		return gender;
	}

	public User() {
		
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
