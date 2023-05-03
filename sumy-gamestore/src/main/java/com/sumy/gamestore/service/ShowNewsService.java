package com.sumy.gamestore.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.mapper.ShowNewsMapper;
import com.sumy.gamestore.model.NewsList;

@RequiredArgsConstructor
@Service
public class ShowNewsService {  //메인 페이지
	
	private final ShowNewsMapper showNewsMapper;
	
	//뉴스 보여주기
	public List<NewsList> selectNewsAll() {
		return showNewsMapper.selectNewsAll();
	}
	
	

}
