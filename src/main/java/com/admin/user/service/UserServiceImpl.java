package com.admin.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.user.model.User;
import com.admin.user.repo.UserRepository;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepo;

	@Override
	public User saveUser(User user) {
		return userRepo.save(user);
	}

	@Override
	public List<User> listAllUsers() {
		return (List<User>)userRepo.findAll();
	}
	
	public User getUserByEmail(String email) {
		return userRepo.getUserByEmail(email);
	}
	
	public User getUserByFirstandLastName(String firstName,String lastName) {
		return userRepo.getUserByFirstandLastName(firstName, lastName);
	}
}
