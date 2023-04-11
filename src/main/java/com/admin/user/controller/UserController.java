package com.admin.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.user.model.User;
import com.admin.user.service.UserService;

import org.springframework.ui.Model;

@Controller
public class UserController {
	
	private static final Object Null = null;
	@Autowired
	private UserService service;
	
	@RequestMapping(value={"/users","/"})
	public String getUserList(Model model) {
		List<User> listUsers = service.listAllUsers();
		
		System.out.println("List Users in Cotroller : "+ listUsers);
		model.addAttribute("listUsers", listUsers);
		return "users";
	}
	
	@RequestMapping("/newuser")
	public String newUser(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user_form";
	}
	
	@RequestMapping(value="/saveUser", method= {RequestMethod.POST})
	public String saveUser(@ModelAttribute("user") User user,Model model) {
		System.out.println("User details at submit: "+ user);
		User savedUser =  service.saveUser(user);
		model.addAttribute("user", savedUser);
		if (savedUser!= Null)
			return "success";
		return "redirect:/";
	}

}
