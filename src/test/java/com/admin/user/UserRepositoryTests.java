package com.admin.user;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;
import static org.assertj.core.api.Assertions.assertThat;

import com.admin.user.model.User;
import com.admin.user.repo.UserRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class UserRepositoryTests {
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	
	@Test
	public void testCreateNewUser() {
		
		User newUser = new User("Vanitha@gamil.com","pooja2023","Pooja","Ravi");
		
		User savedUser = userRepo.save(newUser);
		
		assertThat(savedUser.getId()).isGreaterThan(0);
		
	}
	
	@Test
	public void testListUsers() {
		Iterable<User> listUsers = userRepo.findAll();
		listUsers.forEach(user -> System.out.println(user));
	}
	
	@Test
	public void testGetUserByEmail() {
		User user = userRepo.getUserByEmail("kavitha@gamil.com");
		assertThat(user).isNotNull();
	}
	
	@Test
	public void testUniqueFirstandLastname() {
		User user = userRepo.getUserByFirstandLastName("Kavitha", "P");
		System.out.println(user);
	}
}
