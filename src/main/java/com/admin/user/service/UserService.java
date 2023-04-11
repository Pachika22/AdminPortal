package com.admin.user.service;

import java.util.List;

import com.admin.user.model.User;

public interface UserService {
	
	public User saveUser(User user);
	
	public List<User> listAllUsers();
	
	public User getUserByEmail(String email);
	
	public User getUserByFirstandLastName(String firstName,String lastName);
}
