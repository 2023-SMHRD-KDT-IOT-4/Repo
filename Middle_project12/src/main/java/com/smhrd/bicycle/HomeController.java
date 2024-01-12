package com.smhrd.bicycle;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.bicycle.converter.ImageToBase64;
import com.smhrd.bicycle.mapper.BoardMapper;
import com.smhrd.bicycle.model.Board;
import com.smhrd.bicycle.model.Gps;
import com.smhrd.bicycle.model.User;

//페이지 이동 컨트롤러
@Controller
public class HomeController {
	
	@Autowired
	BoardMapper mapper;
	
	@RequestMapping(value="/44", method=RequestMethod.GET)
	public String test() {
		return "Location_tracking_test";
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/1", method=RequestMethod.GET)
	public String index2() {
		return "index";
	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		return "Mypage";
	}
	
	@RequestMapping(value="/lockUnlock", method=RequestMethod.GET)
	public String lockUnlock() {
		return "lockUnlock";
	}
	
	//게시판 jsp에서 리스트 전체 불러오는거 구현해야함!
	@RequestMapping(value="/Board_01", method=RequestMethod.GET)
	public String Board_01(Model model,HttpSession session,HttpServletRequest request) {
		
		List<Board> list = mapper.boardList();
		
		model.addAttribute("list",list);
		
		System.out.println(list.size());
		
		return "Board_01";
	}
	
	@RequestMapping(value="/Board_02", method=RequestMethod.GET)
	public String Board_02() {
		return "Board_02";
	}
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String notice() {
		return "notice";
	}
	
	@RequestMapping(value="/Alarm", method=RequestMethod.GET)
	public String Alarm() {
		return "Alarm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/map", method=RequestMethod.GET)
	public String map() {
		return "map";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	//라이딩기록확인 페이지로 이동
	@RequestMapping(value="/Data", method=RequestMethod.GET)
	public String Data(Model model) {
		return "Data";
	}
	
	@RequestMapping(value="/BoardContent", method=RequestMethod.GET)
	public String BoardContent(Model model) {
		return "BoardContent";
	}
	

}

