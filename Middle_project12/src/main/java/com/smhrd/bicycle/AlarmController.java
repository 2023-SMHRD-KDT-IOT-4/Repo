package com.smhrd.bicycle;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.bicycle.mapper.ArduinoMapper;

@Controller
public class AlarmController {
	
	@Autowired
	ArduinoMapper mapper;
	
	@RequestMapping(value="stopAlarm" , method=RequestMethod.GET)
	public String stopAlarm(HttpSession session) {
		int res = mapper.stopAlarm();
		if(res>0) {
			System.out.println("stopalarm db 업데이트 성공");
		}else {
			System.out.println("stopalarm db 업데이트 실패");
		}
		return "redirect:/Alarm";
	}
	
	
	@RequestMapping(value = "/checkTheft", method = RequestMethod.POST)
	public @ResponseBody String movePage(HttpSession session,HttpServletResponse response,Model model) {
		
		int theft =  mapper.checkTheft();

		// 도난 예상시 사용자알림
		if (theft == 1) { // 도난 예상시(가속도센서 값 급격히 움직일 시)
			return "Alert: Theft detected!";
		}else {
			return "";
		}

	
	}

	
}
