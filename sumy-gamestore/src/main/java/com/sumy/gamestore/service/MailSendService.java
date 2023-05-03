package com.sumy.gamestore.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.mail.EmailCertification;
import com.sumy.gamestore.mail.MailUtils;

@Service
@RequiredArgsConstructor
public class MailSendService {

	private final EmailCertification emailCertification;
	private JavaMailSender mailSender;// mailSender 객체
	private int size = 0;

	@PostConstruct
	private void init() {
	    mailSender = emailCertification.getJavaMailSender();
	}

	// 인증키 생성
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}

	// 인증코드 난수 발생
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		while (buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		} // 여기서 6자리가 만들어질걸?

		return buffer.toString();
	}

	// 인증메일 보내기
	public String sendAuthMail(String email) {
		// 6자리 난수 인증번호 생성
		String authKey = getKey(6);

		// 인증메일 보내기
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h3>[Sumy Game Store 이메일 인증]</h3>").append("<p>인증번호 : </p>")
					.append("<h1>"+authKey+"</h1>").append("<small style='color:red;'>! 3분 안에 입력해주세요.</small>").toString());
//					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
//					.append("<a href='http://localhost:9080/member/signUpConfirm?email=").append("paro_85@naver.com")
//					.append("&authKey=").append(authKey).append("' target='_blank'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("kimsumy599@gmail.com", "sumy");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return authKey;
	}
}
