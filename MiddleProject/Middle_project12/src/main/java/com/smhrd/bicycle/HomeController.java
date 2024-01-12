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
	public String Board_01(Model model) {
		
		List<Board> list = mapper.boardList();
		
		model.addAttribute("list",list);
		
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
	
	@RequestMapping(value="/Data", method=RequestMethod.GET)
	public String Data() {
		return "Data";
	}
}

