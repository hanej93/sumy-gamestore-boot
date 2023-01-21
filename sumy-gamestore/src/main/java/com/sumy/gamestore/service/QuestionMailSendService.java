package com.sumy.gamestore.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.mail.EmailCertification;
import com.sumy.gamestore.mail.MailUtils;

@Service
public class QuestionMailSendService {
	@Autowired
	private EmailCertification test = new EmailCertification();
	private JavaMailSender mailSender = test.getJavaMailSender();// mailSender 객체
	
	public boolean sendMail(String email, String text) {

		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("Sumy GameStore 문의 답변");
			sendMail.setText(new StringBuffer().append(text).toString());
			sendMail.setFrom("kimsumy599@gmail.com", "sumy");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
