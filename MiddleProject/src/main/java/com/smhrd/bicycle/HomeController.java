package com.smhrd.bicycle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.bicycle.mapper.BoardMapper;
import com.smhrd.bicycle.model.Board;

//페이지 이동 컨트롤러
@Controller
public class HomeController {
	
	@Autowired
	BoardMapper mapper;
	
	@RequestMapping(value="/5418", method=RequestMethod.GET)
	public String test() {
		return "test";
	}
	
	@RequestMapping(value="/2", method=RequestMethod.GET)
	public String test2() {
		return "Location_tracking_test";
	}
	
	//게시판 페이지 이동 / 글 전체리스트 가져오기
	@RequestMapping(value="/3", method=RequestMethod.GET)
	public String index(Model model) {
		
		List<Board> list = mapper.boardList();
		
		model.addAttribute("list",list);
		
		return "게시판 페이지.jsp";
	}
	
	//글 작성 페이지 이동
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String form() {
		return "index";
	}
}

