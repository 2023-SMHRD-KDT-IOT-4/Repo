package com.smhrd.bicycle;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AlarmController {
	
	@RequestMapping(value="stopAlarm" , method=RequestMethod.GET)
	public String stopAlarm(HttpSession session) {
		session.setAttribute("stopAlarm", 3);
		System.out.println(session.getAttribute("stopAlarm"));
		return "redirect:/Alarm";
	}
	
	//모든 jsp페이지에서 이 메서드로 계~~~속 요청하고잇어야댐
	@RequestMapping(value = "checkTheft", method = RequestMethod.POST)
	public @ResponseBody String movePage(HttpSession session,HttpServletResponse response,Model model) {
		
		int theft = 0;
		
		if(session.getAttribute("theft") != null) {
			theft = (int)session.getAttribute("theft");
			System.out.println((int)session.getAttribute("theft"));
		}

		// 도난 예상시 사용자알림
		if (theft == 1) { // 도난 예상시(가속도센서 값 급격히 움직일 시)
			session.setAttribute("theft", 0);
			return "Alert: Theft detected!";
		}else {
			return "";
		}

	
	}
	
	@RequestMapping(value="/testAlarm", method=RequestMethod.GET)
	public String testAlarm(HttpSession session) {
		session.setAttribute("theft", 1);
		System.out.println(session.getAttribute("theft"));
		return "redirect:/Alarm";
	}

	
}
