package com.sumy.gamestore.mail;

import java.util.Properties;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Getter
@Setter
@ConfigurationProperties("email")
@Configuration
public class EmailCertification {

	private String username;
	private String password;

	@Bean(name="mailSender")
	public JavaMailSender getJavaMailSender() {
		Properties properties = new Properties(); 
		properties.put("mail.smtp.auth", true);
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.starttls.required", true);
		properties.put("mail.debug", true);
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587); 
		mailSender.setUsername(username);
		mailSender.setPassword(password);
		mailSender.setDefaultEncoding("utf-8");
		mailSender.setJavaMailProperties(properties);
		
		return mailSender;
		
	}
}
