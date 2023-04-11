package com.admin.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.admin.user.facade.UserFacade;


@RestController
public class UserRestController {
	@Autowired
	private UserFacade userFacade;
	
	@PostMapping("/checkUniqueUser")
	public String checkUniqueUser(@Param("email") String email,@Param("firstName") String firstName,@Param("lastName") String lastName) {
		System.out.println("Email is :"+ email);
		System.out.println("FirstName is :"+ firstName);
		System.out.println("LastName is :"+ lastName);
		String status = userFacade.checkUniqueUser(email, firstName, lastName);
		
		System.out.println("**************"+status);
		return status;
	}
}
