package com.sumy.gamestore.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.WishlistGameInfoDto;
import com.sumy.gamestore.mapper.PaymentMapper;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.model.PurchasedGameList;
import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.model.WishlistGame;
import com.sumy.gamestore.service.GameInfoService;
import com.sumy.gamestore.service.MyPageService;
import com.sumy.gamestore.service.PaymentService;
import com.sumy.gamestore.service.UpdateUserService;
import com.sumy.gamestore.service.WishListService;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;

	// 결제하기
	@RequestMapping("/user/kakaoPayApi")
	@ResponseBody
	public String kakaoPayApi(@RequestBody String totalAmount) {
		
		try {
			// Output
			URL urlAddress = new URL("https://kapi.kakao.com/v1/payment/ready");// 카카오api서버 URL로 생성
			HttpURLConnection connectApiServer = (HttpURLConnection) urlAddress.openConnection();// 클라이언트(나)와 서버를 연결시켜줄
																									// 연결통로 open
			connectApiServer.setRequestMethod("POST");// 카카오api서버에 보낼 요청 메서드 정의
			connectApiServer.setRequestProperty("Authorization", "KakaoAK 9cb0490eb67feb2d83123c719ec179d0");// 카카오api서버에 보낼 데이터 default setting1
			connectApiServer.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");// 카카오api서버에 보낼 데이터 default setting2
			connectApiServer.setDoOutput(true);// 카카오api서버에 보낼 데이터가 있는가? true=yes
			String sendParam = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount="+totalAmount+"&tax_free_amount=0&vat_amount=0&approval_url=http://localhost:8080/user/orderSuccess&fail_url=http://localhost:8080/user/orderFail&cancel_url=http://localhost:8080/user/orderCancel";
			OutputStream packing = connectApiServer.getOutputStream(); // 카카오api서버에 데이터 전송할 친구 설정
			DataOutputStream packingData = new DataOutputStream(packing); // 카카오api서버에 데이터 전송할 친구한테 데이터 보내주는 애 설정
			packingData.writeBytes(sendParam);
			packingData.close();// 카카오api서버로 전송 준비 완료
			int result = connectApiServer.getResponseCode();// 카카오api서버로 전송 후 결과를 int로 받음
			// Input
			InputStream orderReception;
			if (result == 200) {// 성공 시
				orderReception = connectApiServer.getInputStream();
			} else {// 실패 시
				orderReception = connectApiServer.getErrorStream();
			}
			InputStreamReader orderReceptionReader = new InputStreamReader(orderReception);// 받은애 읽기
			BufferedReader receptionTypeString = new BufferedReader(orderReceptionReader);// 읽은 애 형 변환(Byte -> String)
			return receptionTypeString.readLine();// 읽은 애 보내주면서 비움

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}

	// 결제 성공 시
	@RequestMapping("/user/orderSuccess")
	public String orderSuccess(Authentication authentication) {
		paymentService.insertPurchasedGame(authentication);
		
		return "/user/page-order-completed-s";
	}

	// 결제 실패 시
	@RequestMapping("/user/orderFail")
	public String orderFail() {
		return "/user/page-order-completed-f";
	}
	
	// 결제 취소 시
	@RequestMapping("/user/orderCancel")
	public String orderCancel() {
		return "/user/page-order-completed-c";
	}
}
