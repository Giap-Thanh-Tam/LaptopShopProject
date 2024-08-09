package vn.hoidanit.laptopshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.security.reactive.ReactiveManagementWebSecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.reactive.ReactiveSecurityAutoConfiguration;

// @SpringBootApplication(exclude = { ReactiveSecurityAutoConfiguration.class,
// 		ReactiveManagementWebSecurityAutoConfiguration.class })
// @SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class

// )
@SpringBootApplication
// @SpringBootApplication(exclude =
// org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
// @SpringBootApplication(exclude =
// org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class LaptopshopApplication {

	public static void main(String[] args) {
		SpringApplication.run(LaptopshopApplication.class, args);
	}
}
