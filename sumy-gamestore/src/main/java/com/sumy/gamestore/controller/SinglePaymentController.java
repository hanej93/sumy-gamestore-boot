package com.sumy.gamestore.controller;

import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.service.SinglePaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

@RequiredArgsConstructor
@Controller
public class SinglePaymentController {

	private final SinglePaymentService singlePaymentService;

	// 결제하기
	@RequestMapping("/user/kakaoPayApi2")
	@ResponseBody
	public String kakaoPayApi(HttpServletRequest request, GameInfo gameinfo) {
		HttpSession session = request.getSession();
		session.setAttribute("gameId", gameinfo.getGameId());
		System.out.println("결제쪽 컨트롤러 전체 금액" + gameinfo.getGamePrice());
		System.out.println("결제쪽 컨트롤러 게임 아이디" + gameinfo.getGameId());
		try {
			// Output
			URL urlAddress = new URL("https://kapi.kakao.com/v1/payment/ready");// 카카오api서버 URL로 생성
			HttpURLConnection connectApiServer = (HttpURLConnection) urlAddress.openConnection();// 클라이언트(나)와 서버를 연결시켜줄
																									// 연결통로 open
			connectApiServer.setRequestMethod("POST");// 카카오api서버에 보낼 요청 메서드 정의
			connectApiServer.setRequestProperty("Authorization", "KakaoAK 9cb0490eb67feb2d83123c719ec179d0");// 카카오api서버에
																												// 보낼
																												// 데이터
																												// default
																												// setting1
			connectApiServer.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");// 카카오api서버에
																													// 보낼
																													// 데이터
																													// default
																													// setting2
			connectApiServer.setDoOutput(true);// 카카오api서버에 보낼 데이터가 있는가? true=yes
			String sendParam = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount="
					+ gameinfo.getGamePrice()
					+ "&tax_free_amount=0&vat_amount=0&approval_url=http://localhost:8080/user/orderSuccess2&fail_url=http://localhost:8080/user/orderFail2&cancel_url=http://localhost:8080/user/orderCancel2";
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
				System.out.println("결제 통신 실패");
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
	@RequestMapping("/user/orderSuccess2")
	public String orderSuccess(HttpServletRequest request, Authentication authentication, GameInfo gameInfo) {
		int gameId;
		if(gameInfo.getGameId() == 0) {
			HttpSession session = request.getSession();
			gameId = (int)session.getAttribute("gameId");
			System.out.println("세션존재" + gameInfo);
		} else {
			gameId = gameInfo.getGameId();
			System.out.println("세션없음" + gameInfo);
		}
		System.out.println("성공쪽 컨트롤러 게임 아이디"+gameId);
		singlePaymentService.insertPurchasedGame(authentication, gameId);
		
		return "/user/page-order-completed-s";
	}

	// 결제 실패 시
	@RequestMapping("/user/orderFail2")
	public String orderFail() {
		return "/user/page-order-completed-f";
	}

	// 결제 취소 시
	@RequestMapping("/user/orderCancel2")
	public String orderCancel() {
		return "/user/page-order-completed-c";
	}

	// 유저가 게임을 구매했는지 안했는지 확인해야할 시
	@ResponseBody
	@PostMapping("/user/selectPurchasedGameYN")
	public boolean selectPurchasedGameYN(@RequestBody int gameId, Authentication authentication) {
		System.out.println(gameId);
		if (!singlePaymentService.selectPurchasedGameYN(authentication, gameId)) {
			System.out.println("컨트롤러 : 유저가 이미 게임을 구매함.");
			return false;
		}
		return true;
	}
}
