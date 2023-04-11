package com.admin.user.facade;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.admin.user.model.User;
import com.admin.user.service.UserService;
@Component
public class UserFacade {
	
	@Autowired
	UserService service;
	
	public String checkUniqueUser(String email,String firstName,String lastName) {
		System.out.println("In UserFacade-------");
		Map statusMap = new HashMap<>();
		
		//Check for Valid email
		User user =  service.getUserByEmail(email);
		System.out.println("User details when we check for uniqueness"+ user);
		
		User nameUser = service.getUserByFirstandLastName(firstName, lastName);
		System.out.println("User details when we check based on first and last name"+ nameUser);
		
		if(user != null && nameUser != null)
			return "BOTH";
		else if(nameUser != null)
			return "Duplicate_Name";
		else if(user != null)
			return "Duplicate_Email";
		else	
			return "OK";
	}

}
