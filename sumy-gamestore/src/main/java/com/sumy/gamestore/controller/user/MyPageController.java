package com.sumy.gamestore.controller.user;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.service.MyPageService;
import com.sumy.gamestore.service.UpdateUserService;
import com.sumy.gamestore.service.UserInfoService;

/**
 * 회원정보 수정
 */
@RequiredArgsConstructor
@Controller
public class MyPageController {

    private final UserInfoService userInfoService;
    private final MyPageService myPageService;
    private final UpdateUserService updateUserService;
    private final BCryptPasswordEncoder bcryptPasswordEncoder;
    private final AuthenticationManager authenticationManager;

    // 회원 정보 수정 화면
    @GetMapping("/user/login-security")
    public String test7() {
        return "user/page-login-security-1";
    }

    // 닉네임 업데이트
    @ResponseBody
    @PostMapping("/user/profileNickNameUpdate")
    public ResponseEntity<String> profileNickNameUpdate(UserInfo userInfo) {
        myPageService.insertUserNickname(userInfo);
        UserInfo loginUser = userInfoService.유저검색(userInfo.getUserId());

        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(loginUser.getUserEmail(), userInfo.getUserPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return ResponseEntity.ok("닉네임수정 완료");
    }

    // 주소 업데이트
    @ResponseBody
    @PostMapping("/user/profileAddressUpdate")
    public ResponseEntity<String> profileAddressUpdate(UserInfo userInfo) {
        myPageService.insertUserAddress(userInfo);

        UserInfo loginUser = userInfoService.유저검색(userInfo.getUserId());

        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(loginUser.getUserEmail(), userInfo.getUserPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return ResponseEntity.ok("주소수정");
    }

    // 주소 api 화면(popup)
    @GetMapping("/user/jusoPopup")
    public String test17() {
        return "user/jusoPopup";
    }

    // 주소 api 화면(popup)
    @PostMapping("/user/jusoPopup")
    public String test18() {
        return "user/jusoPopup";
    }

    // 연락처 업데이트
    @PostMapping("/user/profilePhonesUpdate")
    public ResponseEntity<String> profilePhonesUpdate(UserInfo userInfo) {
        myPageService.insertUserPhoneNumber(userInfo);

        UserInfo loginUser = userInfoService.유저검색(userInfo.getUserId());

        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(loginUser.getUserEmail(), userInfo.getUserPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return ResponseEntity.ok("연락처 수정 완료");
    }

    // 비밀번호 변경 화면
    @GetMapping("/user/pwdRecovery")
    public String pwdRecovery() {
        return "user/page-login-security-1";
    }

    //비밀번호 변경할 이메일 찾기(로그인 안한 유저)
    @ResponseBody
    @PostMapping("/selectEmail")
    public int selectEmail(@RequestParam(value = "userEmail") String userEmail) {
        System.out.println("컨트롤러에서 받은 유저 이메일 : " + userEmail);
        UserInfo userInfo = new UserInfo();
        userInfo.setUserEmail(userEmail);
        int result = updateUserService.selectUserEmail(userInfo);
        if (result == 0) {
            return 0;
        }

        return result;
    }

    // 비밀번호 업데이트
    @ResponseBody
    @PostMapping("/pwdRecoveryUpdate")
    public ResponseEntity<String> pwdRecoveryUpdate(UserInfo userInfo) {
        System.out.println("수정할 유저정보" + userInfo);
        UserInfo updateUser = userInfoService.유저검색(userInfo.getUserId());
        String oldPS = userInfo.getUserPassword();
        String encodePS = bcryptPasswordEncoder.encode(oldPS);
        System.out.println("인코딩 된 비밀번호 : " + encodePS);
        userInfo.setUserPassword(encodePS);// 암호화

        updateUserService.pwdRecoveryUpdate(userInfo);

        Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(updateUser.getUserEmail(), oldPS));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return ResponseEntity.ok("비밀번호 수정 완료");
    }

    // 수정하기전 비밀번호 체크
    @PostMapping("/user/update/checkPwd")
    @ResponseBody
    public int checkPassword(@RequestBody UserInfo userInfo) {
        System.out.println("유저비밀번호" + userInfo.getUserPassword());
        System.out.println("유저아이디" + userInfo.getUserId());
        UserInfo loginUser = userInfoService.유저검색(userInfo.getUserId());
        String inputPassword = userInfo.getUserPassword();
        String loginPassword = loginUser.getUserPassword();
        if (bcryptPasswordEncoder.matches(inputPassword, loginPassword)) {
            return 1;
        } else {
            return 0;
        }
    }

    // 아직 사용 안하는 컨트롤러 두 개


    // 프로필 사진 업데이트
    @ResponseBody
    @PostMapping("/profileImgUpdate")
    public String profileImgSignUp(@RequestPart(value = "file") MultipartFile file) {

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
            e.printStackTrace();
        }

        return resourcePathname;
    }


    // 프로필 사진 업데이트
    @ResponseBody
    @PostMapping("/user/profileImgUpdate")
    public String profileImgUpdate(@RequestPart(value = "file") MultipartFile file, Authentication authentication, HttpServletRequest request) {
        System.out.println("프로필이미지 변경중");
        PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
        int userId = principal.getUser().getUserId();

        UserInfo userInfo = userInfoService.유저검색(userId);

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
            e.printStackTrace();
        }
        System.out.println(file.getOriginalFilename());
        System.out.println(resourcePathname);
        userInfo.setUserProfileImage(resourcePathname);
        userInfoService.유저수정(userInfo);

        return resourcePathname;
    }
}
