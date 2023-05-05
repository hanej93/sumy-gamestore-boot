package com.sumy.gamestore.mail;

import com.sumy.gamestore.mail.EmailCertification;
import com.sumy.gamestore.mail.MailUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class MailSendService {

	private final JavaMailSender mailSender;// mailSender 객체
	private int size = 0;

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
			String mailContent = new StringBuffer()
					.append("<h3>[Sumy Game Store 이메일 인증]</h3>")
					.append("<p>인증번호 : </p>")
					.append("<h1>" + authKey + "</h1>")
					.append("<small style='color:red;'>! 3분 안에 입력해주세요.</small>")
					.toString();

			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(mailContent);
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

	public boolean sendMail(String email, String text, String subject) {
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject(subject);
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
