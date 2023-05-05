package com.sumy.gamestore.service;

import com.sumy.gamestore.mapper.UpdateUserMapper;
import com.sumy.gamestore.model.UserInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class MyPageService {

    private final UpdateUserMapper updateUserMapper;

    //프로필 이미지 업데이트
    public UserInfo insertUserProfileImage(UserInfo userInfo) {
        log.info("정보수정 전 객체 내용 : {}", userInfo.getUserProfileImage());
        int row = updateUserMapper.insertUserProfileImage(userInfo);
        if (!(row > 0)) {
            log.info("updateUserMapper.insertUserProfileImage(userInfo) 반영된 줄 수 : {}", row);
            log.info("정보수정 완료 객체 내용: {}", userInfo.getUserProfileImage());
            return null;
        }
        return userInfo;//성공 시 객체 반환
    }

    //닉네임 업데이트
    public UserInfo insertUserNickname(UserInfo userInfo) {
        int row = updateUserMapper.insertUserNickname(userInfo);
        if (!(row > 0)) {
            log.info("updateUserMapper.insertUserNickname(userInfo) 반영된 줄 수 : " + row);
            log.info("정보수정 완료 객체 내용" + userInfo.getUserNickname());
            return null;
        }
        return userInfo;//성공 시 객체 반환
    }

    //비밀번호 업데이트
    public UserInfo insertUserPassword(UserInfo userInfo) {
        log.info("정보수정 전 객체 내용 : {}", userInfo.getUserPassword());
        int row = updateUserMapper.insertUserPassword(userInfo);
        if (!(row > 0)) {
            log.info("updateUserMapper.insertUserPassword(userInfo) 반영된 줄 수 : {}", row);
            log.info("정보수정 완료 객체 내용: {}", userInfo.getUserPassword());
            return null;
        }
        return userInfo;//성공 시 객체 반환
    }

    //주소 업데이트
    public UserInfo insertUserAddress(UserInfo userInfo) {
        log.info("정보수정 전 객체 내용 : " + userInfo.getUserAddress());
        int row = updateUserMapper.insertUserAddress(userInfo);
        if (!(row > 0)) {
            log.info("updateUserMapper.insertUserAddress(userInfo) 반영된 줄 수 : {}", row);
            log.info("정보수정 완료 객체 내용 {}", userInfo.getUserAddress());
            return null;
        }
        return userInfo;//성공 시 객체 반환
    }

    //폰번호 업데이트
    public UserInfo insertUserPhoneNumber(UserInfo userInfo) {
        log.info("정보수정 전 객체 내용 : " + userInfo.getUserPhoneNumber());
        int row = updateUserMapper.insertUserPhoneNumber(userInfo);
        if (!(row > 0)) {
            log.info("updateUserMapper.insertUserPhoneNumber(userInfo) 반영된 줄 수 : {}", row);
            log.info("정보수정 완료 객체 내용 {}", userInfo.getUserPhoneNumber());
            return null;
        }
        return userInfo;//성공 시 객체 반환
    }


}
