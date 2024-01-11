package com.smhrd.bicycle;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AlarmController {
	
	@RequestMapping(value="#@!$%^" , method=RequestMethod.GET)
	public void stopAlarm(HttpSession session) {
		session.setAttribute("stopAlarm", 3);
	}
	
	//모든 jsp페이지에서 이 메서드로 계~~~속 요청하고잇어야댐
	@RequestMapping(value = "^%$%$^#WE", method = RequestMethod.POST)
	public int movePage(HttpSession session,HttpServletResponse response) {

		int theft = (int)session.getAttribute("theft");

		// 도난 예상시 사용자알림
		if (theft == 1) { // 도난 예상시(가속도센서 값 급격히 움직일 시)
			try {
				response.sendRedirect("도난예상페이지");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 모바일,웹 사용자에게 알림가게 로직 구현(chrome? kakao?)
			// 도난예상(theft==1)이면 jsp로 알려줘야함,,
		}

		return 1;
	}

	
}
