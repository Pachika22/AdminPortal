package com.admin.user.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.admin.user.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>{
	
	@Query("SELECT u FROM User u WHERE u.email = :email")
	public User getUserByEmail(@Param("email") String email);
	
		
	@Query("SELECT u FROM User u WHERE u.firstName = :firstName and u.lastName = :lastName")			
	public User getUserByFirstandLastName(@Param("firstName") String firstName,@Param("lastName") String lastName);
	
}
