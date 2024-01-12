package com.smhrd.bicycle;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.bicycle.mapper.UserMapper;
import com.smhrd.bicycle.model.User;

// 회원가입, 로그인, 로그아웃
@Controller
public class UserController {
	
	
	@Autowired // 의존성 주입
	UserMapper mapper; // Usermapper 인터페이스로 가는 거
	
	//로그인
	@RequestMapping(value="loginClick"  , method=RequestMethod.POST)
	public String loginclick(@RequestParam("user_id") String user_id , @RequestParam("user_pw") String user_pw
			, HttpSession session) {
		
		User user = new User(user_id, user_pw);
		User result = mapper.login(user);
		
		if (result == null) { // 로그인 실패
			System.out.println("로그인 실패");
		} else { // 로그인 성공
			 session.setAttribute("user", result);
		}

		return "redirect:/";

	}
	
	// 로그아웃
	@RequestMapping(value="logoutClick" , method=RequestMethod.POST)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
}
