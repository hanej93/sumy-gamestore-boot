package com.sumy.gamestore.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sumy.gamestore.auth.kakao.KakaoController;
import com.sumy.gamestore.auth.naver.NaverLoginVO;
import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.service.JoinedUserService;
import com.sumy.gamestore.service.LoginUserService;
import com.sumy.gamestore.service.MailSendService;
import com.sumy.gamestore.service.UserInfoService;

@Controller
//@RequestMapping("/sumy")
public class LoginController {
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	JoinedUserService joinedUserService;
	
	@Autowired
	UserInfoService userInfoService;

	@Autowired
	NaverLoginVO naverLoginVO;
	
	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	LoginUserService loginUserService;

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/auth/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginVO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginVO.getUserProfile(oauthToken); // String형식의 json데이터
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(apiResult);
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		System.out.println(response_obj);

		String userEmail = (String) response_obj.get("email");
		String rawPassword = (String) response_obj.get("id");
		String userPassword = bcryptPasswordEncoder.encode(rawPassword);
		
		String userProvider = "naver";
		String userNickname = (String) response_obj.get("nickname");
		String userProfileImage = (String) response_obj.get("profile_image");
		String userPhoneNumber = (String) response_obj.get("mobile");
		String userName = (String) response_obj.get("name");
		String userBirthDateStr = (String) response_obj.get("birthyear") + "-" + (String) response_obj.get("birthday");
		LocalDate userBirthDate = LocalDate.parse(userBirthDateStr);
		int gender = 0;
		if (((String) response_obj.get("gender")).equals("M")) {
			gender = 1;
		} else {
			gender = 0;
		}
		String authorityRate = "ROLE_USER";
		
		UserInfo userInfo = userInfoService.유저검색_이메일(userEmail);
		
		if(userInfo == null) {
			
			
			UserInfo joinUser 
				= UserInfo.builder()
						  .userId(0)
						  .userEmail(userEmail)
						  .userPassword(userPassword)
						  .userProvider(userProvider)
						  .userNickname(userNickname)
						  .userProfileImage(userProfileImage)
						  .userPhoneNumber(userPhoneNumber)
						  .userName(userName)
						  .userBirthDate(userBirthDate)
						  .userGender(gender)
						  .userJoinedDate(LocalDate.now())
						  .userAuthorityRate(authorityRate)
						  .build();
			joinedUserService.addUser(joinUser);
		}
		
		UserInfo updatePwdUser = userInfoService.유저검색_이메일(userEmail);
		if(!bcryptPasswordEncoder.matches(rawPassword, updatePwdUser.getUserPassword()) ) {
			updatePwdUser.setUserPassword(userPassword);
			userInfoService.유저수정(updatePwdUser);
		}
		

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(userEmail, rawPassword));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/";
	}

	@RequestMapping(value = "/auth/kakao/callback", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView(); // 결과값을 node에 담아줌
		JsonNode node = KakaoController.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		String kemail = null;
		String kname = null;
		String kgender = null;
		String kbirthday = null;
		String kage = null;
		String kimage = null; // 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		System.out.println(kakao_account);
		System.out.println(properties);
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kimage = properties.path("profile_image").asText();
		String kprovider = "kakao";
		kgender = kakao_account.path("gender").asText();
		int gender = 0;
		if(kgender.equals("male")) {
			gender = 1;
		} else {
			gender = 0;
		}
		String authorityRate = "ROLE_USER";
		
		String rawPassword = "sumy1234!@#$";
		String userPassword = bcryptPasswordEncoder.encode(rawPassword);
		
		UserInfo kuserInfo = userInfoService.유저검색_이메일(kemail);
		
		if(kuserInfo == null) {
			UserInfo joinUser 
			= UserInfo.builder()
					  .userId(0)
					  .userEmail(kemail)
					  .userPassword(userPassword)
					  .userProvider(kprovider)
					  .userNickname(kname)
					  .userProfileImage(kimage)
					  .userName(kname)
					  .userBirthDate(LocalDate.now())
					  .userGender(gender)
					  .userJoinedDate(LocalDate.now())
					  .userAuthorityRate(authorityRate)
					  .build();
			joinedUserService.addUser(joinUser);
		}
		
		
		UserInfo updatePwdUser = userInfoService.유저검색_이메일(kemail);
		if(!bcryptPasswordEncoder.matches(rawPassword, updatePwdUser.getUserPassword()) ) {
			updatePwdUser.setUserPassword(userPassword);
			userInfoService.유저수정(updatePwdUser);
		}
		
		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(kemail, rawPassword));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/";
	}// end kakaoLogin()

	// 로그인 화면
	@GetMapping("/sumy/login")
	public String test1(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);

		String kakaoUrl = KakaoController.getAuthorizationUrl(session);

		model.addAttribute("kakaoUrl", kakaoUrl);

		return "user/page-login-1";
	}

	// 로그인 완료 화면
	@PostMapping("/sumy/loginSuccess")
	public String test2(UserInfo userInfo) {
		System.out.println(userInfo);
//		userInfo.setUserJoinedDate(LocalDate.now());// 가입날짜 세팅
//		userInfo.setUserAuthorityRate("ROLE_USER");// 사용자 계정 세팅
//		int total = joinedUserService.addUser(userInfo);
		loginUserService.selectUser(userInfo);

//		if(!loginUserService.selectUser(userInfo)) {
//			System.out.println("로그인 실패");
//		}
//		System.out.println("로그인 성공");
		return "user/home-page-1";
	}

	// 비밀번호 찾기 화면
	@GetMapping("/sumy/password-recovery")
	public String test12() {

		return "user/page-password-recovery-1";
	}

	// 프로필 변경
	@ResponseBody
	@PostMapping("/sumy/profileImgAdd")
	public String test17(@RequestPart(value = "file", required = false) MultipartFile file) {
		System.out.println(file.getOriginalFilename());

		if (file == null || file.isEmpty()) {
			System.out.println("파일이 없음");
		}

		// 현재 날짜 조회 - ex) 2021-07-07
		String currentDate = LocalDate.now().toString();
		// 파일 저장 경로 (현재 날짜를 포함) - ex) C:/upload/2021-07-07/
		String uploadFilePath = "C:\\upload\\" + currentDate + "/";

		// 파일 확장자 ex) jpg, png ..
		String prefix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1,
				file.getOriginalFilename().length());

		// 랜덤아이디로 파일명 생성
		String filename = UUID.randomUUID().toString() + "." + prefix;

		// 폴더가 없다면 생성
		File folder = new File(uploadFilePath);
		if (!folder.isDirectory()) {
			folder.mkdirs();
		}

		// 실제 저장되는 위치
		String pathname = uploadFilePath + filename;
		// 가상 가상 파일 위치 - ex) /upload/2021-07-07/파일명.jpg
		String resourcePathname = "/upload/" + currentDate + "/" + filename;
		File dest = new File(pathname);
		try {
			file.transferTo(dest);

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resourcePathname;
	}

	// 회원가입 화면
	@GetMapping("/sumy/join")
	public String test14() {

		return "user/page-signup-1";
	}

	// 비밀번호 찾기 이메일 인증
	@ResponseBody
	@GetMapping("/sumy/checkMail")
	public String SendMail(String mail, Model model) {
		MailSendService mss = new MailSendService();
		String authKey = mss.sendAuthMail(mail);// 인증메일 전송
		model.addAttribute("authKey", authKey);
		System.out.println("인증보내떠!");
		return authKey;
	}

	// 주소 api 화면(popup)
	@GetMapping("/sumy/jusoPopup")
	public String test17() {

		return "user/jusoPopup";
	}

	// 주소 api 화면(popup)
	@PostMapping("/sumy/jusoPopup")
	public String test18() {

		return "user/jusoPopup";
	}

	// 회원가입 완료 화면
	@PostMapping("/joinedSuccess")
	public String test8(UserInfo userInfo) {
		String encodePS = bcryptPasswordEncoder.encode(userInfo.getUserPassword());
		userInfo.setUserPassword(encodePS);// 암호화
		int total = joinedUserService.addUser(userInfo);
		return "redirect:/sumy/login";
	}
}
